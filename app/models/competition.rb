class Competition < ActiveRecord::Base
  belongs_to :difficulty
  belongs_to :competition_type
  belongs_to :category

  has_many :competition_subscriptions, dependent: :destroy
  has_many :competition_transactions, dependent: :destroy
  has_many :competition_exercises
  has_many :users, through: :competition_subscriptions
  has_many :teams, through: :competition_subscriptions
  has_many :exercise_types, through: :competition_exercises
  
  accepts_nested_attributes_for :competition_exercises, allow_destroy: true

  validates_presence_of :name

  def creator
    User.find_by(id: creator_id)
  end

  def registered?(user)
    if self.team?
      return competition_subscriptions.find_by(team: user.team, competition: self).present?
    else
      return competition_subscriptions.find_by(user: user, competition: self).present?
    end
  end

  def users_by_rank
    users.sort { |a, b| a.total_xp_for_competition(self) <=> b.total_xp_for_competition(self) }.reverse
  end

  def contains_exercise_type?(exercise_type)
    competition_exercises.where(exercise_type: exercise_type).present?
  end

  def level
    difficulty.level if difficulty
  end
  
  def type
    team ? 'Team' : 'Individual'
  end

  def set_win_condition(user)
    return if self.name == "Global"
    return if self.competition_type.use_limit == false
    self.team? ? set_win_condition_by_type(user.team) : set_win_condition_by_type(user)
  end

  def set_win_condition_by_type(user_or_team)
    return if users.empty? && user_or_team.kind_of?(User)
    return if teams.empty? && user_or_team.kind_of?(Team)
    result = []
    competition_exercises.each do |comp_e|
      exercises = user_or_team.exercises_for_competition_by_exercise_type(self, comp_e.exercise_type)
      metrics = comp_e.metrics        
      metrics.each do |metric|
        exercise_total = exercises.sum { |exercise| exercise.send(metric) }
        result << (exercise_total >= comp_e.limit)
      end  
    end
     
    is_won = result.all? { |r| r } # returns true if all limits met
    set_winner(user_or_team) if is_won
  end

  # set_winner_for_total_xp(:team) for teams
  # set_winner_for_total_xp(:user) for individual
  # TODO Create a background job that calls this once a day
  def set_winner_for_total_xp(user_or_team)
    return if Date.today < end_date     
    units = competition_subscriptions.collect{|comp_s| comp_s.send(user_or_team)}
    winner = units.max { |a, b| a.total_xp_for_competition(self) <=> b.total_xp_for_competition(self) }     
    set_winner(winner)
  end

  def set_winner(user_or_team)
    subscription = CompetitionSubscription.find_by(user: user_or_team, competition: self) if user_or_team.kind_of? User
    subscription = CompetitionSubscription.find_by(team: user_or_team, competition: self) if user_or_team.kind_of? Team
    subscription.rank = 1
    subscription.save
    self.active = false
    self.winner_id = user_or_team.id
    self.save
  end

  def self.compute_winners_for_date_based_competitions
    comp_type = CompetitionType.find_by(name: 'Most XP by Date')
    comps = Competition.where(active: true, competition_type_id: comp_type.id)
    comps.each do |comp|
      comp.team? ? comp.set_winner_for_total_xp(:team) : comp.set_winner_for_total_xp(:user)
    end
  end
end

