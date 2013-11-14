FactoryGirl.define do
  factory :challenge_type do
    name "Best Time"
    use_date true
    use_limit  500
    xp_multiplier 100
  end
end