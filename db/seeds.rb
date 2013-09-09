Activity.destroy_all!
[
  {name: 'Pushups', activity_type: 'strength', use_reps: true, use_sets: true, use_duration: false, use_distance: false, use_weight: false},
  {name: 'Pullups', activity_type: 'strength', use_reps: true, use_sets: true, use_duration: false, use_distance: false, use_weight: false},
  {name: 'Situps', activity_type: 'strength', use_reps: true, use_sets: true, use_duration: false, use_distance: false, use_weight: false},
  {name: 'Squats', activity_type: 'strength', use_reps: true, use_sets: true, use_duration: false, use_distance: false, use_weight: false}
].each do |activity|
  Activity.create!(activity)
end