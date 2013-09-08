FactoryGirl.define do
  factory :activity do
    name "activity"
        
    factory :pushups do
      name "Pushups"
      sets 3
      reps 20      
    end

    factory :running do
      name "Running"
      duration 45
      distance 5.4     
    end
  end
end