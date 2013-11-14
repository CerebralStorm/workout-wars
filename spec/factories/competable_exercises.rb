FactoryGirl.define do
  factory :competable_exercise do
    exercise_type
    limit 500
    association :competable, factory: :competition
  end
end