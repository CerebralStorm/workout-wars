class Competition < ActiveRecord::Base
  has_many :users, through: :competition_subscriptions
  has_many :competition_subscriptions
end
