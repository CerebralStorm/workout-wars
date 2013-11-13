class CreateChallengeExercises < ActiveRecord::Migration
  def change
    create_table :challenge_exercises do |t|
      t.integer :challenge_id
      t.integer :exercise_type_id
      t.integer :limit

      t.timestamps
    end
  end
end
