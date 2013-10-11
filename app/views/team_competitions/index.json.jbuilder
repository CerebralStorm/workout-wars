json.array!(@team_competitions) do |team_competition|
  json.extract! team_competition, :name, :start_date, :end_date, :competition_type_id, :number_of_team, :lower_level_restriction, :upper_level_restriction, :active, :creator_id, :winner_id
  json.url team_competition_url(team_competition, format: :json)
end
