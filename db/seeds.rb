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
  {name: 'Pullups',         category_id: strength_category.id,   use_reps: true, use_distance: false,  use_duration: false, use_weight: false, use_calories: false, xp_multiplier: 4},
  {name: 'Situps',          category_id: strength_category.id,   use_reps: true, use_distance: false,  use_duration: false, use_weight: false, use_calories: false, xp_multiplier: 0.75},
  {name: 'Squats',          category_id: strength_category.id,   use_reps: true, use_distance: false,  use_duration: false, use_weight: false, use_calories: false, xp_multiplier: 1},
  {name: 'Lunges',          category_id: strength_category.id,   use_reps: true, use_distance: false,  use_duration: false, use_weight: false, use_calories: false, xp_multiplier: 1},
  {name: 'Burpees',         category_id: strength_category.id,   use_reps: true, use_distance: false,  use_duration: false, use_weight: false, use_calories: false, xp_multiplier: 3},
  {name: 'Running',         category_id: endurance_category.id,  use_reps: false, use_distance: true,  use_duration: false, use_weight: false, use_calories: false, xp_multiplier: 40},
  {name: 'Biking',          category_id: endurance_category.id,  use_reps: false, use_distance: true,  use_duration: false, use_weight: false, use_calories: false, xp_multiplier: 15},
  {name: 'Swimming',        category_id: endurance_category.id,  use_reps: false, use_distance: true,  use_duration: false, use_weight: false, use_calories: false, xp_multiplier: 300},
  {name: 'Hiking',          category_id: endurance_category.id,  use_reps: false, use_distance: true,  use_duration: false, use_weight: false, use_calories: false, xp_multiplier: 20}, 
  {name: 'Aerobics',        category_id: endurance_category.id,  use_reps: false, use_distance: false, use_duration: true , use_weight: false, use_calories: false, xp_multiplier: 1}, 
  {name: 'Yoga',            category_id: balance_category.id,    use_reps: false, use_distance: false, use_duration: true , use_weight: false, use_calories: false, xp_multiplier: 5} 
].each do |exercise|
  ExerciseType.create!(exercise)
end

Difficulty.destroy_all
["Very Easy", "Easy", "Average", "Hard", "Insane"].each do |level|
  Difficulty.create!(level: level)
end

CompetitionType.destroy_all
[
  {name: 'First to Complete', use_date: false, use_limit: true},
  {name: 'Most XP by Date', use_date: true, use_limit: false},
].each do |comp_type|
  CompetitionType.create!(comp_type)
end

ChallengeType.destroy_all
[
  {name: "Best Time", use_date: false, use_limit: true},
  {name: "Total By Date", use_date: true, use_limit: false},
  {name: "Reach A Goal By Date", use_date: true, use_limit: false},
  {name: "Reach A Goal By Limit", use_date: false, use_limit: true},
].each do |challenge_type|
  ChallengeType.create!(challenge_type)
end

best_time = ChallengeType.find_by(name: "Best Time")
average = Difficulty.find_by(level: "Average")
[
  {name: 'Fastest 100 pushups', reward: 115, challenge_type_id: best_time.id, difficulty_id: average.id}, 
  {name: 'Fastest 100 situps', reward: 80, challenge_type_id: best_time.id, difficulty_id: average.id} 
].each do |challenge|
  Challenge.create!(challenge)
end
