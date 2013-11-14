FactoryGirl.define do
  factory :team do
    sequence(:name) {|n| "Team #{n}" } 
    association :teamable, factory: :competition 
  end
end