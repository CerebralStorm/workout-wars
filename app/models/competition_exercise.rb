class CompetitionExercise < ActiveRecord::Base
  belongs_to :competition
  belongs_to :exercise_type

  delegate :metrics, to: :exercise_type
end
