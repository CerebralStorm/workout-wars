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

Difficulty.destroy_all
["Very Easy", "Easy", "Average", "Hard", "Insane"].each do |level|
  Difficulty.create!(level: level)
end

Competition.destroy_all
global_comp = Competition.create!(name: "Global")
ExerciseType.all.each do |e_type|
  CompetitionExercise.create!(competition_id: global_comp.id, exercise_type_id: e_type.id)
end