class CreateExerciseTypes < ActiveRecord::Migration
  def change
    create_table :exercise_types do |t|
      t.string :name
      t.string :category
      t.integer :xp_multiplier

      t.timestamps
    end
  end
end