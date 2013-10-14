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
    if self.is_team?
      return competition_subscriptions.find_by(team: user.team, competition: self).present?
    else
      team_ids = user.teams.collect(&:id)
      return team_competition_subscriptions.any? { |t| team_ids.include?(t.team_id) }
    end
  end

  def users_by_rank
    users.sort { |a, b| a.get_total_xp_for_competition(self) <=> b.get_total_xp_for_competition(self) }.reverse
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
      users = competition_subscriptions.collect(&:user)
      winner = users.max { |a, b| a.get_total_xp_for_competition(self) <=> b.get_total_xp_for_competition(self) }     
      set_winner(winner)
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
      set_winner(user) if is_won
    end
  end

  def set_winner(user)
    subscription = CompetitionSubscription.find_by(user: user, competition: self)
    subscription.rank = 1
    subscription.save
    self.active = false
    self.winner_id = user.id
    self.save
  end
end


