class Exercise < ActiveRecord::Base
  belongs_to :workout
  belongs_to :activity

  delegate :name, to: :activity
  delegate :use_reps, to: :activity
  delegate :use_sets, to: :activity
  delegate :use_duration, to: :activity
  delegate :use_distance, to: :activity
  delegate :use_weight, to: :activity
  delegate :fields, to: :activity
  validates_presence_of :activity_id

end
