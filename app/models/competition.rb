class Competition < ActiveRecord::Base
  has_many :users, through: :competition_subscriptions
  has_many :competition_subscriptions, dependent: :destroy
  has_many :competition_exercises
  has_many :team_subscriptions
  has_many :teams, through: :team_subscriptions
  has_many :exercise_types, through: :competition_exercises
  belongs_to :difficulty

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
end
