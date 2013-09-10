class Exercise < ActiveRecord::Base
  belongs_to :workout
  belongs_to :activity

  delegate :name, to: :activity
  validates_presence_of :activity_id

end
