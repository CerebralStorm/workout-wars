class CreateCompetitionTransactions < ActiveRecord::Migration
  def change
    create_table :competition_transactions do |t|
      t.integer :competition_id
      t.integer :user_id
      t.integer :exercise_id

      t.timestamps
    end
  end
end
