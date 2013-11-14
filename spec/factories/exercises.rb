FactoryGirl.define do
  factory :exercise do
    user
    exercise_type  
    reps 20
    distance 5
    duration 50
    weight 20
    calories 0
  end
end