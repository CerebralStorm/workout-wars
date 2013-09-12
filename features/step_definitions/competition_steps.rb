Given(/^there is an existing competition$/) do
  user = User.find_by_email("ray@bustinghosts.com")
  FactoryGirl.create(:competition, creator_id: user.id)
end

Given(/^I visit the competitions pages$/) do
  step 'I click on "competitions-link"'
end

When(/^I select a startdate and enddate$/) do
  step 'I select "2013" from "competition_start_date_1i"' 
  step 'I select "September" from "competition_start_date_2i"'
  step 'I select "11" from "competition_start_date_3i"' 
  step 'I select "2013" from "competition_end_date_1i"' 
  step 'I select "October" from "competition_end_date_2i"'
  step 'I select "11" from "competition_end_date_3i"' 
end