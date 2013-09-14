Given(/^database is seeded$/) do
  load "#{Rails.root}/db/seeds.rb"
end

When(/^I click on "(.*?)"$/) do |arg1|
  find("[rel='#{arg1}']").click
end

When /^I fill out the form with the following attributes:$/ do |table|
  puts table.rows_hash
  criteria = table.rows_hash.each do |field, value|
    fill_in field, :with => value
  end
end

When /^I click the (.*?) button$/ do |button|
  click_button button
end

When /^I select "(.*)" from "(.*)"$/ do |value, field|
  select(value, :from => field) 
end

When(/^I select the first "(.*?)" from "(.*?)"$/) do |value, field|
  page.find(field, value, match: :first).click
end

When(/^I confirm$/) do
  page.driver.browser.switch_to.alert.accept
end

Then(/^I should see a "(.*?)" success message$/) do |name|
  page.should have_content "#{name} was successfully created."
end

Then(/^I should see a "(.*?)" update message$/) do |name|
  page.should have_content "#{name} was successfully updated."
end

Then(/^I should see a "(.*?)" delete message$/) do |name|
  page.should have_content "#{name} was successfully deleted."
end

Then /^show me the page$/ do
  save_and_open_page
end
