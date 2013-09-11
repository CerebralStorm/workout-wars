FactoryGirl.define do
  factory :competition do
    name "Billy Bo Bob Battle Royal"
    start_date Date.today
    end_date Date.today + 14.days
    difficulty
    creator_id 1

    factory :private_competition do
      is_private true
    end
  end
end