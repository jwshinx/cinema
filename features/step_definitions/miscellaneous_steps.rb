Given(/^I visit new_actor page$/) do
  visit '/actors/new'
end   
Given(/^I visit edit_actor page for "(.*?)"$/) do |arg1|
  tokens = arg1.split(' ')
  c = Actor.find_by_firstname tokens[0]
  visit "/actors/#{c.id}/edit"
end
Given(/^I visit show_actor page for "(.*?)"$/) do |arg1|
  tokens = arg1.split(' ')
  c = Actor.find_by_firstname tokens[0]
  visit "/actors/#{c.id}"
end
When(/^I click "(.*?)"$/) do |arg1|
  click_button arg1 
end       
Then(/^I should be on the page for "(.*?)"$/) do |arg1| 
  tokens = arg1.split(' ')
  a = Actor.find_by_firstname tokens[0]
  visit "/actors/#{a.id}"
end               
Then(/^I should not see page content: "(.*?)"$/) do |arg1|
  page.should_not have_content("#{arg1}") 
end          
Then(/^I should see page content: "(.*?)" "(.*?)" "(.*?)" million dollars$/) do |arg1, arg2, arg3|
  page.should have_content("#{arg1} #{arg2}") 
  page.should have_content("#{arg2}") 
  page.should have_content("#{arg3}") 
end   

Then(/^I should see page content: "(.*?)"$/) do |arg1|
  page.should have_content("#{arg1}") 
end