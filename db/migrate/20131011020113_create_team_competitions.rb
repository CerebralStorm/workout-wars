class CreateTeamCompetitions < ActiveRecord::Migration
  def change
    create_table :team_competitions do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.integer :competition_type_id
      t.integer :number_of_teams
      t.integer :lower_level_restriction
      t.integer :upper_level_restriction
      t.boolean :is_private, default: false
      t.boolean :active, default: true
      t.integer :creator_id
      t.integer :winner_id

      t.timestamps
    end
  end
end
