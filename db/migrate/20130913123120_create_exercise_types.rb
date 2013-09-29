class CreateExerciseTypes < ActiveRecord::Migration
  def change
    create_table :exercise_types do |t|
      t.string :name
      t.string :category
      t.integer :xp_multiplier
      t.boolean :use_reps, default: false
      t.boolean :use_distance, default: false
      t.boolean :use_duration, default: false
      t.boolean :use_weight, default: false
      t.boolean :use_calories_burned, default: false

      t.timestamps
    end
  end
end
