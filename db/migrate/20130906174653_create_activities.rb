class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :workout_id
      t.integer :reps
      t.integer :sets
      t.float :duration
      t.float :distance

      t.timestamps
    end
  end
end
