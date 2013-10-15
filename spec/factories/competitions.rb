FactoryGirl.define do
  factory :competition do
    name "Billy Bo Bob Battle Royal"
    start_date Date.today
    end_date Date.today + 14.days
    difficulty
    competition_type
    creator_id 1
    active true

    factory :private_competition do
      public false
    end
  end
end