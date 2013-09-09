class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.integer :max_participants
      t.integer :difficulty_id
      t.boolean :is_private, default: false
      t.integer :creator_id

      t.timestamps
    end
  end
end
