class CompetitionSubscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :competition

  validates_presence_of :user_id
  validates_presence_of :competition_id
end
