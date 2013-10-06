class Competition < ActiveRecord::Base
  belongs_to :difficulty
  belongs_to :category
  
  has_many :users, through: :competition_subscriptions
  has_many :competition_subscriptions, dependent: :destroy
  has_many :competition_exercises
  has_many :team_subscriptions
  has_many :teams, through: :team_subscriptions
  has_many :exercise_types, through: :competition_exercises

  validates_presence_of :name

  def creator
    User.find_by(id: creator_id)
  end

  def registered?(user)
    competition_subscriptions.find_by user_id: user.id, competition_id: self.id
  end

  def level
    difficulty.level if difficulty
  end
  
  def type
    individual ? 'Individual' : 'Team'
  end

  def check_win_condition(user)
    return if self.name == "Global"

    if end_date 
      return if Date.today < end_date
      #TODO 
      # Check all users and see who has the most to determine winner
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
        if is_won
          subscription = CompetitionSubscription.find_by(user: user, competition: self)
          subscription.rank = 1
          subscription.save
          self.active = false
          self.winner_id = user.id
          self.save
        end
    end
  end
end


