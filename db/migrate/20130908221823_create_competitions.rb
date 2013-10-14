class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.integer :competition_type_id
      t.integer :max_participants
      t.integer :number_of_teams
      t.integer :lower_level_restriction
      t.integer :upper_level_restriction
      t.integer :difficulty_id
      t.boolean :team, default: false
      t.boolean :public, default: true
      t.boolean :active, default: true
      t.integer :creator_id
      t.integer :winner_id

      t.timestamps
    end
  end
end
