class CreateXpTransactions < ActiveRecord::Migration
  def change
    create_table :xp_transactions do |t|
      t.integer :amount
      t.integer :user_id
      t.integer :xp_source_id
      t.string :xp_source_type

      t.timestamps
    end
    add_index :xp_transactions, [:xp_source_id, :xp_source_type]
  end
end
