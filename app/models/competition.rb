class Competition < ActiveRecord::Base
  has_many :users, through: :competition_subscriptions
  has_many :competition_subscriptions
  belongs_to :difficulty

  delegate :level, to: :difficulty

  validates_presence_of :name
  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_presence_of :difficulty_id
  validates_presence_of :creator_id
  
end
