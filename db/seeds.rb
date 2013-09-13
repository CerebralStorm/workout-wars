[
  {name: 'Pushups', exercise_type: 'strength'}, 
  {name: 'Pullups', exercise_type: 'strength'},
  {name: 'Situps', exercise_type: 'strength'},
  {name: 'Squats', exercise_type: 'strength'},
  {name: 'Lunges', exercise_type: 'strength'},
  {name: 'Burpees', exercise_type: 'strength'},
  {name: 'Running', exercise_type: 'endurance'},
  {name: 'Biking', exercise_type: 'endurance'},
  {name: 'Swimming', exercise_type: 'endurance'},
  {name: 'Hiking', exercise_type: 'endurance'}, 
  {name: 'Aerobics', exercise_type: 'endurance'}, 
  {name: 'Yoga', exercise_type: 'balance'}, 
].each do |exercise|
  Exercise.create!(exercise)
end

Difficulty.delete_all
["Very Easy", "Easy", "Average", "Hard", "Insane"].each do |level|
  Difficulty.find_or_create_by(level: level)
end