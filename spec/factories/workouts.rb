FactoryGirl.define do
  factory :workout do
    date Date.today
    user
    exercises {
      Array.new(2) { FactoryGirl.create(:exercise) } 
    }
  end
end