class Competition < ActiveRecord::Base
  belongs_to :difficulty
  belongs_to :win_condition
  belongs_to :category
  
  has_many :users, through: :competition_subscriptions
  has_many :competition_subscriptions, dependent: :destroy
  has_many :competition_exercises
  has_many :team_subscriptions
  has_many :teams, through: :team_subscriptions
  has_many :exercise_types, through: :competition_exercises

  validates_presence_of :name
  validates_presence_of :win_condition_id

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
    return if win_condition.description == 'No End'
    is_won = win_condition.fields.all? { |field| check_field(user, field)}
    if is_won
      subscription = CompetitionSubscription.find_by(user: user, competition: self)
      subscription.rank = 1
      subscription.save
      self.active = false
      self.winner_id = user.id
      self.save
    end
  end

  def check_field(user, field)
    method = user_method_for_win_field(field) 
    return Date.today >= win_condition.date_limit if method == :date_limit
    
    exercises = user.exercises_for_competition(self)  
    total = 0
    exercises.each do |exercise|       
      total += exercise.send(method)
    end

    total >= win_condition.send(field)
  end

  def user_method_for_win_field(field)
    value = case field 
      when :rep_limit then :reps
      when :distance_limit then :distance
      when :duration_limit then :duration
      when :weight_limit then :weight
      when :calorie_limit then :calories
      when :date_limit then :date_limit
    end
    value
  end
end
