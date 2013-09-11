FactoryGirl.define do
  factory :activity do
    name "activity"
        
    factory :pushups do
      name "Pushups"
      use_sets true
      use_reps true     
    end

    factory :running do
      name "Running"
      use_duration true
      use_distance true     
    end
  end
end