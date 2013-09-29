class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.integer :user_id
      t.integer :exercise_type_id
      t.integer :reps
      t.float :distance
      t.integer :duration
      t.integer :weight
      t.integer :calories_burned

      t.timestamps
    end
  end
end
