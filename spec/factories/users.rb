FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "lurk#{n}@lifttoomuch.com"
    end
    password "muscles1"
    password_confirmation { |u| u.password }
    name "Hulk Hogan"
    gender "male"
    address "123 Hulkamania Ave"
    phone "8016661234"
    height 75
    weight 215
    provider "facebook"
    uid "12345"

    factory :admin do
      admin true
    end
  end
end