class CreateTeamSubscriptions < ActiveRecord::Migration
  def change
    create_table :team_subscriptions do |t|
      t.integer :user_id
      t.integer :team_id
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
