class CompetitionExercise < ActiveRecord::Base
  belongs_to :competition
  belongs_to :exercise_type
end
