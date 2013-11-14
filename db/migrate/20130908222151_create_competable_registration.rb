class CreateCompetableRegistration < ActiveRecord::Migration
  def change
    create_table :competable_registrations do |t|
      t.integer :user_id
      t.belongs_to :registerable, polymorphic: true
      t.integer :team_id
      t.integer :rank

      t.timestamps
    end
    #add_index :competable_registrations, [:registerable_id, :registerable_type]
  end
end
