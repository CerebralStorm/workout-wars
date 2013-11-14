FactoryGirl.define do
  factory :competable_transaction do
    user
    association :transactable, factory: :competition
  end
end