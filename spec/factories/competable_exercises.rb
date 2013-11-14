FactoryGirl.define do
  factory :competable_exercise do
    limit 500
    association :competable, factory: :competition
  end
end