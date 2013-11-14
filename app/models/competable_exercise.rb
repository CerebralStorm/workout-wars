class CompetableExercise < ActiveRecord::Base
  belongs_to :exercise_type
  belongs_to :competable, polymorphic: true

  delegate :name, to: :exercise_type
  delegate :metrics, to: :exercise_type

  validates_presence_of :exercise_type_id
  validates_presence_of :competable_id
  validates_presence_of :competable_type

  # def self.default_scope
  #   includes(:exercise_type).order('exercise_types.name ASC')
  # end
end
