class CreateDifficulties < ActiveRecord::Migration
  def change
    create_table :difficulties do |t|
      t.string :level
      t.float :xp_multiplier

      t.timestamps
    end
  end
end
