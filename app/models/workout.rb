class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :exercises

  validates_presence_of :user_id
  validates_presence_of :date

  accepts_nested_attributes_for :exercises, allow_destroy: true

  def xp
    self.exercises.sum(:xp)
  end
end
