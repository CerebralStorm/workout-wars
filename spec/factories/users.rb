FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "egon#{n}@bustinghosts.com"
    end
    password "do3rayEgon"
    password_confirmation { |u| u.password }
    name "Egon Spengler"
    address "14 N Moore St, New York, NY 10013"
    phone "2125552368"
    height 72
    weight 175
    provider "facebook"
    uid "12345"

    factory :admin do
      admin true
    end
  end
end