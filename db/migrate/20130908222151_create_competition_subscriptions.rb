class CreateCompetitionSubscriptions < ActiveRecord::Migration
  def change
    create_table :competition_subscriptions do |t|
      t.integer :user_id
      t.integer :competition_id

      t.timestamps
    end
  end
end
