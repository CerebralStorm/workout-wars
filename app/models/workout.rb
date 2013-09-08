class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :activities

  validates_presence_of :user_id
  validates_presence_of :date

  accepts_nested_attributes_for :activities, allow_destroy: true
end
