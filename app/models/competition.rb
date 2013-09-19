class Competition < ActiveRecord::Base
  has_many :users, through: :competition_subscriptions
  has_many :competition_subscriptions, dependent: :destroy
  belongs_to :difficulty

  delegate :level, to: :difficulty

  validates_presence_of :name
  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_presence_of :difficulty_id
  validates_presence_of :creator_id

  def creator
    User.find(creator_id)
  end

  def registered?(user)
    competition_subscriptions.find_by user_id: user.id, competition_id: self.id
  end
  
end
