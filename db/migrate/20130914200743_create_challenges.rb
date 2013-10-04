class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.integer :reward
      t.integer :difficulty_id
      t.integer :challenge_type_id
      t.integer :end_condition_id

      t.timestamps
    end
  end
end
