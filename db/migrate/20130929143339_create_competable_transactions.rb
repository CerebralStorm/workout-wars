class CreateCompetableTransactions < ActiveRecord::Migration
  def change
    create_table :competable_transactions do |t|
      t.belongs_to :transactable
      t.integer :user_id
      t.integer :exercise_id

      t.timestamps
    end
  end
end
