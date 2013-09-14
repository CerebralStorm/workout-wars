json.array!(@challenges) do |challenge|
  json.extract! challenge, :name, :reward, :difficulty_id, :challenge_type_id
  json.url challenge_url(challenge, format: :json)
end
