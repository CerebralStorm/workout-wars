[
  {name: 'Pushups', category: 'strength'}, 
  {name: 'Pullups', category: 'strength'},
  {name: 'Situps', category: 'strength'},
  {name: 'Squats', category: 'strength'},
  {name: 'Lunges', category: 'strength'},
  {name: 'Burpees', category: 'strength'},
  {name: 'Running', category: 'endurance'},
  {name: 'Biking', category: 'endurance'},
  {name: 'Swimming', category: 'endurance'},
  {name: 'Hiking', category: 'endurance'}, 
  {name: 'Aerobics', category: 'endurance'}, 
  {name: 'Yoga', category: 'balance'}, 
].each do |exercise|
  ExerciseType.create!(exercise)
end

Difficulty.delete_all
["Very Easy", "Easy", "Average", "Hard", "Insane"].each do |level|
  Difficulty.find_or_create_by(level: level)
end