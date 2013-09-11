Given(/^I am logged in as "(.*?)" with password "(.*?)"$/) do |email, password|
  unless email.blank?
    visit new_user_session_path
    fill_in "Email", :with => email
    fill_in "Password", :with => password
    find("[rel='login-button']").click
  end
end

Given(/^I visit the workouts pages$/) do
  find("[rel='user-workouts-link']").click
end

Then(/^I should see a success message$/) do
  page.should have_content "Workout was successfully created."
end

When(/^I select a date and activity$/) do
  step 'I select "2013" from "workout_date_1i"' 
  step 'I select "September" from "workout_date_2i"'
  step 'I select "11" from "workout_date_3i"' 
  step 'I select "Pushups" from "workout_exercises_attributes_0_activity_id"'  
end