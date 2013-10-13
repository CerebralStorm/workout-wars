class CreateTeamCompetitionExercises < ActiveRecord::Migration
  def change
    create_table :team_competition_exercises do |t|
      t.integer :limit
      t.integer :exercise_type_id
      t.integer :team_competition_id

      t.timestamps
    end
  end
end
