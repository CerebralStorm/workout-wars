FactoryGirl.define do
  factory :challenge_attempt do
    completion_time 3000
    user
    challenge
  end
end