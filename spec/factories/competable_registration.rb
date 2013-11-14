FactoryGirl.define do
  factory :competable_registration do
    user
    association :registerable, factory: :competition
  end
end