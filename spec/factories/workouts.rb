FactoryGirl.define do
  factory :workout do
    date Date.today
    user_id 1
    exercises {
      Array.new(2) { FactoryGirl.create(:exercise) } 
    }
  end
end