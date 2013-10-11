class CreateTeamCompetitionSubscriptions < ActiveRecord::Migration
  def change
    create_table :team_competition_subscriptions do |t|
      t.integer :team_id
      t.integer :team_competition_id

      t.timestamps
    end
  end
end
