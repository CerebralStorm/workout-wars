Given(/^there is a user "(.*?)" with password "(.*?)"$/) do |email, password|
  user = User.find_by_email(email)
  FactoryGirl.create :user, email: email, password: password, password_confirmation: password unless user
end

When(/^I visit the home page$/) do
  visit root_path
end

When(/^I visit the password retrieval page$/) do
  visit new_user_password_path
end

When(/^I try to log in with the (.*?) password$/) do |flag|
  password = (flag == "right") ? "slimer-Ecto-1" : "staypuft"
  first('[rel="login-link"]').click
  fill_in "user_email", with: "ray@bustinghosts.com"
  fill_in "user_password", with: password
  find("[rel='login-button']").click
end

Then(/^I should see the landing page$/) do
  page.should have_content 'LLIFE Cause Gift Registry'
end

Then(/^I should( not)? be logged in$/)do |negate|
  expectation = negate ? :should : :should_not
  page.send(expectation, have_content('Invalid email or password.'))
end

Then(/^I should see the dashboard for "(.*?)"$/) do |email|
  user = User.find_by_email(email)
  current_path.should == root_path
  page.should have_content "Welcome #{user.first_name}"
  page.should have_content "My Registry List"
  page.should have_content "Recent Activity"
  page.should have_content "Account"
end

Then(/^I should see the new cause form$/) do
  current_path.should == new_cause_path
end

Then(/^I should be able to get a password reset email$/) do
  fill_in "user_email", with: "ray@bustinghosts.com"
  find("[rel='send-reset']").click
  ActionMailer::Base.deliveries.count.should == 1
  page.should have_content "You will receive an email with instructions about how to reset your password in a few minutes."
end

Then(/^I should be able to change my password to "(.*?)"$/) do |password|
  user = User.find_by_email("ray@bustinghosts.com")
  visit edit_user_password_path(reset_password_token: user.reset_password_token)
  fill_in "user_password", with: password
  fill_in "user_password_confirmation", with: password
  find('[rel="change-password-button"]').click
end

Given(/^I try to edit my account with(out entering)? my current password$/) do |skip_password|
  password = "slimer-Ecto-1"
  find('[rel="edit-account"]').click
  fill_in "user_address", with: "123 Some Street"
  fill_in "user_current_password", with: password unless skip_password
  find('[rel="save-changes"]').click
end

Then(/^I should not be able to update my account$/) do
  page.should have_content "Current password can't be blank"
end

# Then(/^I should see a success message$/) do
#   page.should have_content "You updated your account successfully"
# end

Then(/^I visit my profile page$/) do
  user = User.find_by_email("ray@bustinghosts.com")
  visit profile_path(user)
end

Then(/^I should see (my|the user's) profile$/) do |type|
  user = User.find_by_email("ray@bustinghosts.com")
  page.should have_content user.first_name
  page.should have_content user.last_name
  page.should have_css('#profile')
end

Then(/^I log out$/) do
  first('[rel="logout-link nofollow"]').click
end

Then(/^I should be logged out/) do
  page.should have_content "You need to sign in or sign up before continuing."
end
