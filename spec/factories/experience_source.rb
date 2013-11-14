FactoryGirl.define do
  factory :experience_source do
    amount 400
    user
    association :experienceable, factory: :exercise
  end
end