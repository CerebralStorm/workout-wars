json.array!(@competitions) do |competition|
  json.extract! competition, :name, :start_date, :end_date, :max_participants, :difficulty, :private
  json.url competition_url(competition, format: :json)
end
