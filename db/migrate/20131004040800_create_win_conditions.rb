class CreateWinConditions < ActiveRecord::Migration
  def change
    create_table :win_conditions do |t|
      t.string :description
      t.integer :category_id
      t.integer :rep_limit
      t.float :distance_limit
      t.integer :duration_limit
      t.integer :weight_limit
      t.integer :calorie_limit
      t.datetime :date_limit
      t.boolean :most_reps
      t.boolean :most_distance
      t.boolean :most_duration
      t.boolean :most_weight
      t.boolean :most_calories
      t.timestamps
    end
  end
end
