class Competition < ActiveRecord::Base
  belongs_to :difficulty
  belongs_to :competition_type
  belongs_to :category

  has_many :competition_subscriptions, dependent: :destroy
  has_many :competition_transactions, dependent: :destroy
  has_many :competable_exercises, as: :competable
  has_many :users, through: :competition_subscriptions, source: :user
  has_many :teams, dependent: :destroy
  has_many :exercise_types, through: :competable_exercises

  after_create :create_teams, :unless => Proc.new{ self.team == false }
  
  accepts_nested_attributes_for :competable_exercises, allow_destroy: true
  accepts_nested_attributes_for :teams, allow_destroy: true

  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: false

  def creator
    User.find_by(id: creator_id)
  end

  def winner
    team? ? Team.find_by(id: winner_id) : User.find_by(id: winner_id)
  end

  def team?
    teams.count > 0
  end

  def registered?(user)
    competition_subscriptions.find_by(user: user, competition: self).present?
  end

  def user_team(user)
    teams.collect {|t| t if t.users.include?(user)}.reject(&:nil?).first
  end

  def user_team_subscription(user)
    team = user_team(user)
    return if team.nil?
    TeamSubscription.find_by(user_id: user.id, team_id: team.id)
  end

  def users_by_rank
    users.sort { |a, b| a.total_xp_for_competition(self) <=> b.total_xp_for_competition(self) }.reverse
  end

  def contains_exercise_type?(exercise_type)
    competable_exercises.where(exercise_type: exercise_type).present?
  end

  def level
    difficulty.level if difficulty
  end
  
  def type
    self.team? ? 'Team' : 'Individual'
  end

  def set_win_condition(user)
    return if self.name == "Global"
    return if self.competition_type.use_limit == false
    self.team? ? set_team_win_condition : set_individual_win_condition(user)
  end

  def set_individual_win_condition(user)
    result = []
    competable_exercises.each do |comp_e|       
      comp_e.metrics.each do |metric|      
        exercise_total = user_total_by_exercise_type_and_metric(user, comp_e.exercise_type, metric)
        result << (exercise_total >= comp_e.limit)
      end  
    end
     
    is_won = result.all? { |r| r } # returns true if all limits met
    set_winner(user) if is_won
  end

  def set_team_win_condition
    result = []
    competable_exercises.each do |comp_e|       
      comp_e.metrics.each do |metric| 
        teams.each do |team|         
          team_metric_total = 0
          team.users.each do |user|
            team_metric_total += user_total_by_exercise_type_and_metric(user, comp_e.exercise_type, metric)
          end
          result << (team_metric_total >= comp_e.limit)  
        end  
      end  
    end

    is_won = result.any? { |r| r } # returns true if all limits met
    
    if is_won
      teams.each_with_index do |team, index|
        if result[index] 
          set_winner(team)
          return
        end
      end
    end
    
  end

  def user_total_by_exercise_type_and_metric(user, exercise_type, metric)
    exercises = user.exercises_for_competition_by_exercise_type(self, exercise_type)
    exercises.sum { |exercise| exercise.send(metric) }
  end

  # set_winner_for_total_xp(:team) for teams
  # set_winner_for_total_xp(:user) for individual
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

  def create_teams
    count = self.number_of_teams - self.teams.count
    count.times do 
      self.teams.create!
    end
  end
end

