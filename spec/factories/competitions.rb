FactoryGirl.define do
  factory :competition do
    sequence(:name) {|n| "Competition #{n}" }    
    start_date Date.today
    end_date Date.today + 14.days
    difficulty
    competition_type
    creator_id 1
    active true

    factory :private_competition do
      public false
    end

    factory :team_competition do
      number_of_teams 2
    end
  end
end