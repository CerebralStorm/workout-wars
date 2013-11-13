class CreateCompetitionSubscriptions < ActiveRecord::Migration
  def change
    create_table :competable_subscriptions do |t|
      t.integer :user_id
      t.belongs_to :competable_subscriptions, polymorphic: true
      t.integer :team_id
      t.integer :rank

      t.timestamps
    end
    add_index :competable_subscriptions, [:competable_subscriptions_id, :competable_subscriptions_type]
  end
end
