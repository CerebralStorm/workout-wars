class CreateCompetitionExercises < ActiveRecord::Migration
  def change
    create_table :competition_exercises do |t|
      t.integer :exercise_type_id
      t.integer :competition_id

      t.timestamps
    end
  end
end
