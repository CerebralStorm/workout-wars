FactoryGirl.define do
  factory :challenge do
    sequence(:name) {|n| "Challenge #{n}" }    
    start_date Date.today
    end_date Date.today + 14.days
    difficulty
    challenge_type

    factory :team_challenge do
      team true
      number_of_teams 2
      after(:create) {|instance| instance.create_teams }
    end
  end
end