FactoryGirl.define do
  factory :competable_transaction do
    user
    exercise
    association :transactable, factory: :competition
  end
end