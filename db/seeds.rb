Activity.delete_all
[
  {name: 'Pushups', activity_type: 'strength', use_reps: true, use_sets: true, use_duration: false, use_distance: false, use_weight: false},
  {name: 'Pullups', activity_type: 'strength', use_reps: true, use_sets: true, use_duration: false, use_distance: false, use_weight: false},
  {name: 'Situps', activity_type: 'strength', use_reps: true, use_sets: true, use_duration: false, use_distance: false, use_weight: false},
  {name: 'Squats', activity_type: 'strength', use_reps: true, use_sets: true, use_duration: false, use_distance: false, use_weight: true},
  {name: 'Lunges', activity_type: 'strength', use_reps: true, use_sets: true, use_duration: false, use_distance: false, use_weight: true},
  {name: 'Burpees', activity_type: 'strength', use_reps: true, use_sets: true, use_duration: false, use_distance: false, use_weight: false},
  {name: 'Running', activity_type: 'endurance', use_reps: false, use_sets: false, use_duration: true, use_distance: true, use_weight: false},
  {name: 'Biking', activity_type: 'endurance', use_reps: false, use_sets: false, use_duration: true, use_distance: true, use_weight: false},
  {name: 'Swimming', activity_type: 'endurance', use_reps: false, use_sets: false, use_duration: true, use_distance: true, use_weight: false},
  {name: 'Hiking', activity_type: 'endurance', use_reps: false, use_sets: false, use_duration: true, use_distance: true, use_weight: false}, 
  {name: 'Aerobics', activity_type: 'endurance', use_reps: false, use_sets: false, use_duration: true, use_distance: false, use_weight: false}, 
  {name: 'Yoga', activity_type: 'balance', use_reps: false, use_sets: false, use_duration: true, use_distance: false, use_weight: false}, 
].each do |activity|
  Activity.create!(activity)
end