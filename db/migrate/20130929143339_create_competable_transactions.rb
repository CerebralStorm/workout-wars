class CreateCompetableTransactions < ActiveRecord::Migration
  def change
    create_table :competable_transactions do |t|
      t.belongs_to :transactable, polymorphic: true
      t.integer :user_id
      t.integer :exercise_id

      t.timestamps
    end
    #add_index :competable_transactions, [:transactable_id, :transactable_type]
  end
end
