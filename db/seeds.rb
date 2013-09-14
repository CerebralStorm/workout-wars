ExerciseType.destroy_all
[
  {name: 'Pushups',   category: 'strength',   xp_multiplier: 1}, 
  {name: 'Pullups',   category: 'strength',   xp_multiplier: 4},
  {name: 'Situps',    category: 'strength',   xp_multiplier: 0.75},
  {name: 'Squats',    category: 'strength',   xp_multiplier: 1},
  {name: 'Lunges',    category: 'strength',   xp_multiplier: 1},
  {name: 'Burpees',   category: 'strength',   xp_multiplier: 3},
  {name: 'Running',   category: 'endurance',  xp_multiplier: 40},
  {name: 'Biking',    category: 'endurance',  xp_multiplier: 15},
  {name: 'Swimming',  category: 'endurance',  xp_multiplier: 300},
  {name: 'Hiking',    category: 'endurance',  xp_multiplier: 20}, 
  {name: 'Aerobics',  category: 'endurance',  xp_multiplier: 1}, 
  {name: 'Yoga',      category: 'balance',    xp_multiplier: 1.2} 
].each do |exercise|
  ExerciseType.create!(exercise)
end

Difficulty.destroy_all
["Very Easy", "Easy", "Average", "Hard", "Insane"].each do |level|
  Difficulty.find_or_create_by(level: level)
end