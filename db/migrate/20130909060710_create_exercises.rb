class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.integer :workout_id
      t.integer :activity_id
      t.integer :reps
      t.integer :sets
      t.float :distance
      t.integer :duration
      t.integer :weight

      t.timestamps
    end
  end
end
