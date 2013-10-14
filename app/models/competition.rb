class Competition < ActiveRecord::Base
  belongs_to :difficulty
  belongs_to :competition_type
  belongs_to :category
  
  has_many :users, through: :competition_subscriptions
  has_many :competition_subscriptions, dependent: :destroy
  has_many :competition_exercises
  has_many :team_competition_subscriptions
  has_many :teams, through: :team_competition_subscriptions
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
    users.sort { |a, b| a.get_total_xp_for_competition(self) <=> b.get_total_xp_for_competition(self) }.reverse
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

  def check_win_condition(user)
    return if self.name == "Global"
    if end_date 
      return if Date.today < end_date
      if self.team?
        teams = competition_subscriptions.collect(&:team)
        winner = teams.max { |a, b| a.get_total_xp_for_competition(self) <=> b.get_total_xp_for_competition(self) }
        set_team_winner(winner)
      else
        users = competition_subscriptions.collect(&:user)
        winner = users.max { |a, b| a.get_total_xp_for_competition(self) <=> b.get_total_xp_for_competition(self) }     
        set_user_winner(winner)
      end
    else
      if self.team?
        result = []
        competition_exercises.each do |comp_e|
          exercises = user.exercises_for_competition_by_exercise_type(self, comp_e.exercise_type)
          metrics = comp_e.metrics        
          metrics.each do |metric|
            exercise_total = exercises.sum { |exercise| exercise.send(metric) }
            result << (exercise_total >= comp_e.limit)
          end  
        end
         
        is_won = result.all? { |r| r } # returns true if all limits met
        set_team_winner(user) if is_won
      else
        result = []
        competition_exercises.each do |comp_e|
          exercises = user.exercises_for_competition_by_exercise_type(self, comp_e.exercise_type)
          metrics = comp_e.metrics        
          metrics.each do |metric|
            exercise_total = exercises.sum { |exercise| exercise.send(metric) }
            result << (exercise_total >= comp_e.limit)
          end  
        end
         
        is_won = result.all? { |r| r } # returns true if all limits met
        set_user_winner(user) if is_won
      end
    end
  end

  def set_user_winner(user)
    subscription = CompetitionSubscription.find_by(user: user, competition: self)
    subscription.rank = 1
    subscription.save
    self.active = false
    self.winner_id = user.id
    self.save
  end

  def set_team_winner(team)
    subscription = CompetitionSubscription.find_by(team: team, competition: self)
    subscription.rank = 1
    subscription.save
    self.active = false
    self.winner_id = team.id
    self.save
  end
end

