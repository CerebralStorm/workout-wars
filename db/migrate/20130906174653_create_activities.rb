class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.string :activity_type
      t.integer :workout_id
      t.integer :reps
      t.integer :sets
      t.float :duration
      t.float :distance
      t.integer :calories
      t.integer :heart_rate
      t.boolean :use_reps, default: false
      t.boolean :use_sets, default: false
      t.boolean :use_duration, default: false
      t.boolean :use_distance, default: false
      t.boolean :use_calories, default: false
      t.boolean :use_heart_rate, default: false

      t.timestamps
    end
  end
end
