class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.integer :max_participants
      t.integer :number_of_teams
      t.integer :difficulty_id
      t.integer :win_condition_id
      t.boolean :is_private, default: false
      t.boolean :individual, default: true
      t.integer :creator_id

      t.timestamps
    end
  end
end
