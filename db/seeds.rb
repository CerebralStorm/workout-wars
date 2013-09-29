ExerciseType.destroy_all
[
  {name: 'Pushups',   category: 'strength',   xp_multiplier: 1},
  {name: 'Timed Pushups',   category: 'strength',   xp_multiplier: 1}, 
  {name: 'Pullups',   category: 'strength',   xp_multiplier: 4},
  {name: 'Timed Pullups',   category: 'strength',   xp_multiplier: 1},
  {name: 'Situps',    category: 'strength',   xp_multiplier: 0.75},
  {name: 'Timed Situps',   category: 'strength',   xp_multiplier: 1},
  {name: 'Squats',    category: 'strength',   xp_multiplier: 1},
  {name: 'Timed Squats',   category: 'strength',   xp_multiplier: 1},
  {name: 'Lunges',    category: 'strength',   xp_multiplier: 1},
  {name: 'Timed Lunges',   category: 'strength',   xp_multiplier: 1},
  {name: 'Burpees',   category: 'strength',   xp_multiplier: 3},
  {name: 'Timed Burpees',   category: 'strength',   xp_multiplier: 1},
  {name: 'Running',   category: 'endurance',  xp_multiplier: 40},
  {name: 'Timed Running',   category: 'strength',   xp_multiplier: 1},
  {name: 'Biking',    category: 'endurance',  xp_multiplier: 15},
  {name: 'Timed Biking',   category: 'strength',   xp_multiplier: 1},
  {name: 'Swimming',  category: 'endurance',  xp_multiplier: 300},
  {name: 'Timed Swimming',   category: 'strength',   xp_multiplier: 1},
  {name: 'Hiking',    category: 'endurance',  xp_multiplier: 20}, 
  {name: 'Timed Hiking',   category: 'strength',   xp_multiplier: 1},
  {name: 'Aerobics',  category: 'endurance',  xp_multiplier: 1}, 
  {name: 'Yoga',      category: 'balance',    xp_multiplier: 5} 
].each do |exercise|
  ExerciseType.create!(exercise)
end

Difficulty.destroy_all
["Very Easy", "Easy", "Average", "Hard", "Insane"].each do |level|
  Difficulty.create!(level: level)
end

Competition.destroy_all
global_comp = Competition.create!(name: "Global")
ExerciseType.all.each do |e_type|
  CompetitionExercise.create!(competition_id: global_comp.id, exercise_type_id: e_type.id)
end