class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.string :activity_type
      t.integer :reps
      t.integer :sets
      t.float :duration
      t.float :distance
      t.integer :weight
      t.boolean :use_reps, default: false
      t.boolean :use_sets, default: false
      t.boolean :use_duration, default: false
      t.boolean :use_distance, default: false
      t.boolean :use_weight, default: false

      t.timestamps
    end
  end
end
