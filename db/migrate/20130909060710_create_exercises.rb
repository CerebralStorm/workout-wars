class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :exercise_type
      t.integer :workout_id
      t.integer :exercise_type_id
      t.integer :reps
      t.integer :sets
      t.float :distance
      t.integer :duration
      t.integer :weight
      t.integer :calories
      t.integer :xp, default: 0

      t.timestamps
    end
  end
end
