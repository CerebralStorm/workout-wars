When(/^I click on "(.*?)"$/) do |arg1|
  find("[rel='#{arg1}']").click
end

Then /^show me the page$/ do
  save_and_open_page
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

Given(/^database is seeded$/) do
  load "#{Rails.root}/db/seeds.rb"
end
