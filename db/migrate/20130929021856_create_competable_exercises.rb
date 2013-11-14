class CreateCompetableExercises < ActiveRecord::Migration
  def change
    create_table :competable_exercises do |t|
      t.integer :exercise_type_id
      t.belongs_to :competable, polymorphic: true
      t.integer :limit

      t.timestamps
    end
    add_index :competable_exercises, [:competable_id, :competable_type]
  end
 
end
