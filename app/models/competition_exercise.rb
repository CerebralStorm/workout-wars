class CompetitionExercise < ActiveRecord::Base
  belongs_to :competition
  belongs_to :exercise_type

  delegate :name, to: :exercise_type
  delegate :metrics, to: :exercise_type

  def self.default_scope
    includes(:exercise_type).order('exercise_types.name ASC')
  end
end
