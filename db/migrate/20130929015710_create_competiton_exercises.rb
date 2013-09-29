class CreateCompetitonExercises < ActiveRecord::Migration
  def change
    create_table :competiton_exercises do |t|
      t.integer :exercise_type_id
      t.integer :competition_id

      t.timestamps
    end
  end
end
