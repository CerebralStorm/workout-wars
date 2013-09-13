class Exercise < ActiveRecord::Base
  belongs_to :workout
  belongs_to :exercise_type

  def total_reps
    reps * sets
  end
end
