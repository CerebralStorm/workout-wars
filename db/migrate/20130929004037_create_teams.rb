class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.belongs_to :teamable, polymorphic: true

      t.timestamps
    end
    add_index :teams, [:teamable_id, :teamable_type]
  end
end
