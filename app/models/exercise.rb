class Exercise < ActiveRecord::Base
  belongs_to :workout
  belongs_to :activity

  validates_presence_of :workout_id
  validates_presence_of :activity_id

end
