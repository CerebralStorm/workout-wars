class CreateExerciseTypes < ActiveRecord::Migration
  def change
    create_table :exercise_types do |t|
      t.string :name
      t.integer :category_id
      t.integer :xp_multiplier
      t.boolean :use_reps, default: false
      t.boolean :use_distance, default: false
      t.boolean :use_duration, default: false
      t.boolean :use_weight, default: false
      t.boolean :use_calories, default: false

      t.timestamps
    end
  end
end
