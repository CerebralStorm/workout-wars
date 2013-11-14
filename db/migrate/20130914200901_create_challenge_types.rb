class CreateChallengeTypes < ActiveRecord::Migration
  def change
    create_table :challenge_types do |t|
      t.string :name
      t.integer :category_id
      t.integer :xp_multiplier
      t.boolean :use_date, default: false
      t.boolean :use_limit, default: false

      t.timestamps
    end
  end
end
