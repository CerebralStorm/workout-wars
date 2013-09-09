class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :exercises
  has_many :activities, through: :exercises

  validates_presence_of :user_id
  validates_presence_of :date

  accepts_nested_attributes_for :exercises, allow_destroy: true
end
