class CreateCompetitionTypes < ActiveRecord::Migration
  def change
    create_table :competition_types do |t|
      t.string :name
      t.boolean :use_date, default: false

      t.timestamps
    end
  end
end
