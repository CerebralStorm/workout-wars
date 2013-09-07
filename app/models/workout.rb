class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :activities

  accepts_nested_attributes_for :activities, allow_destroy: true
end
