Category.destroy_all
["Strength", "Endurance", "Speed", "Balance", "Flexibility"].each do |name|
  Category.create!(name: name)
end

strength_category = Category.find_by(name: "Strength")
endurance_category = Category.find_by(name: "Endurance")
speed_category = Category.find_by(name: "Speed")
balance_category = Category.find_by(name: "Balance")
flexibility_category = Category.find_by(name: "Flexibility")

ExerciseType.destroy_all
[
  {name: 'Pushups',         category_id: strength_category.id,   use_reps: true, use_distance: false,  use_duration: false, use_weight: false, use_calories: false, xp_multiplier: 1},
  {name: 'Timed Pushups',   category_id: strength_category.id,   use_reps: true, use_distance: false,  use_duration: true , use_weight: false, use_calories: false, xp_multiplier: 1}, 
  {name: 'Pullups',         category_id: strength_category.id,   use_reps: true, use_distance: false,  use_duration: false, use_weight: false, use_calories: false, xp_multiplier: 4},
  {name: 'Timed Pullups',   category_id: strength_category.id,   use_reps: true, use_distance: false,  use_duration: true , use_weight: false, use_calories: false, xp_multiplier: 1},
  {name: 'Situps',          category_id: strength_category.id,   use_reps: true, use_distance: false,  use_duration: false, use_weight: false, use_calories: false, xp_multiplier: 0.75},
  {name: 'Timed Situps',    category_id: strength_category.id,   use_reps: true, use_distance: false,  use_duration: true , use_weight: false, use_calories: false, xp_multiplier: 1},
  {name: 'Squats',          category_id: strength_category.id,   use_reps: true, use_distance: false,  use_duration: false, use_weight: false, use_calories: false, xp_multiplier: 1},
  {name: 'Timed Squats',    category_id: strength_category.id,   use_reps: true, use_distance: false,  use_duration: true , use_weight: false, use_calories: false, xp_multiplier: 1},
  {name: 'Lunges',          category_id: strength_category.id,   use_reps: true, use_distance: false,  use_duration: false, use_weight: false, use_calories: false, xp_multiplier: 1},
  {name: 'Timed Lunges',    category_id: strength_category.id,   use_reps: true, use_distance: false,  use_duration: true , use_weight: false, use_calories: false, xp_multiplier: 1},
  {name: 'Burpees',         category_id: strength_category.id,   use_reps: true, use_distance: false,  use_duration: false, use_weight: false, use_calories: false, xp_multiplier: 3},
  {name: 'Timed Burpees',   category_id: strength_category.id,   use_reps: true, use_distance: false,  use_duration: true , use_weight: false, use_calories: false, xp_multiplier: 1},
  {name: 'Running',         category_id: endurance_category.id,  use_reps: false, use_distance: true,  use_duration: false, use_weight: false, use_calories: false, xp_multiplier: 40},
  {name: 'Timed Running',   category_id: speed_category.id,      use_reps: false, use_distance: true,  use_duration: true , use_weight: false, use_calories: false, xp_multiplier: 1},
  {name: 'Biking',          category_id: endurance_category.id,  use_reps: false, use_distance: true,  use_duration: false, use_weight: false, use_calories: false, xp_multiplier: 15},
  {name: 'Timed Biking',    category_id: speed_category.id,      use_reps: false, use_distance: true,  use_duration: true , use_weight: false, use_calories: false, xp_multiplier: 1},
  {name: 'Swimming',        category_id: endurance_category.id,  use_reps: false, use_distance: true,  use_duration: false, use_weight: false, use_calories: false, xp_multiplier: 300},
  {name: 'Timed Swimming',  category_id: speed_category.id,      use_reps: false, use_distance: true,  use_duration: true , use_weight: false, use_calories: false, xp_multiplier: 1},
  {name: 'Hiking',          category_id: endurance_category.id,  use_reps: false, use_distance: true,  use_duration: false, use_weight: false, use_calories: false, xp_multiplier: 20}, 
  {name: 'Timed Hiking',    category_id: endurance_category.id,  use_reps: false, use_distance: true,  use_duration: true , use_weight: false, use_calories: false, xp_multiplier: 1},
  {name: 'Aerobics',        category_id: endurance_category.id,  use_reps: false, use_distance: false, use_duration: true , use_weight: false, use_calories: false, xp_multiplier: 1}, 
  {name: 'Yoga',            category_id: balance_category.id,    use_reps: false, use_distance: false, use_duration: true , use_weight: false, use_calories: false, xp_multiplier: 5} 
].each do |exercise|
  ExerciseType.create!(exercise)
end

WinCondition.destroy_all
[
  { description: 'First to 1000 reps', category_id: strength_category.id, rep_limit: 1000  },
  { description: 'First to 10 miles', category_id: endurance_category.id, distance_limit: 10 },
  { description: 'Most in an a week', category_id: endurance_category.id, duration_limit: 1.week },
  { description: 'Most in an a month', category_id: endurance_category.id, duration_limit: 1.month },
  { description: 'Most reps in a single set', category_id: strength_category.id, most_reps: true },
  { description: 'Most weight in a single rep', category_id: strength_category.id, most_weight: true },
  { description: 'Most calories in a month', category_id: strength_category.id, most_calories: true, duration_limit: 1.month },
  { description: 'No End', category_id: strength_category.id },
].each do |win_condition|
  WinCondition.create!(win_condition)
end

Difficulty.destroy_all
["Very Easy", "Easy", "Average", "Hard", "Insane"].each do |level|
  Difficulty.create!(level: level)
end

Competition.destroy_all
win_condition = WinCondition.find_by(description: 'No End')
global_comp = Competition.create!(name: "Global", win_condition_id: win_condition.id)
ExerciseType.all.each do |e_type|
  CompetitionExercise.create!(competition_id: global_comp.id, exercise_type_id: e_type.id)
end