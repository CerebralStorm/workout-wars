FactoryGirl.define do
  factory :workout do
    date Date.today
    user
    activities {
      Array.new(2) { |i| i % 2 == 0 ? FactoryGirl.create(:pushups) : FactoryGirl.create(:running) } 
    }
  end
end