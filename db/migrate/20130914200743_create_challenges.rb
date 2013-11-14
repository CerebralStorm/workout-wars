class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.integer :challenge_type_id
      t.integer :max_participants
      t.integer :number_of_teams
      t.integer :lower_level_restriction
      t.integer :upper_level_restriction
      t.integer :difficulty_id
      t.boolean :team, default: false
      t.boolean :public, default: true
      t.integer :reward

      t.timestamps
    end
  end
end
