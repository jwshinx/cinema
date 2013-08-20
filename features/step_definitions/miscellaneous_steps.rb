Given(/^I visit new_actor page$/) do
  visit '/actors/new'
end
When(/^I click "(.*?)"$/) do |arg1|
  click_button arg1 
end       
Then(/^I should be on the page for "(.*?)"$/) do |arg1| 
  tokens = arg1.split(' ')
  a = Actor.find_by_firstname tokens[0]
  visit "/actors/#{a.id}"
end