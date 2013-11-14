class CompetableRegistration < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  belongs_to :registerable, polymorphic: true

  validates_presence_of :user_id
  validates_presence_of :registerable_id
  validates_presence_of :registerable_type
end
