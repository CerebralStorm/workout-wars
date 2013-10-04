class Competition < ActiveRecord::Base
  belongs_to :difficulty
  belongs_to :end_condition
  belongs_to :category
  
  has_many :users, through: :competition_subscriptions
  has_many :competition_subscriptions, dependent: :destroy
  has_many :competition_exercises
  has_many :team_subscriptions
  has_many :teams, through: :team_subscriptions
  has_many :exercise_types, through: :competition_exercises

  validates_presence_of :name
  validates_presence_of :end_condition_id

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

  def check_end_condition(user)
    end_condition.fields.each do |field|
      check_field(user, field)
    end
  end

  def check_field(user, field)
    # TODO
    # case field
    #   when :reps_limit

  end
end
