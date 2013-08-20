Given(/^I fill in firstname with "(.*?)", lastname "(.*?)" and highest paid "(.*?)"$/) do |arg1, arg2, arg3|
  fill_in('actor[firstname]', :with => arg1)               
  fill_in('actor[lastname]', :with => arg2) 
  fill_in('actor[highest_pay]', :with => arg3) 
end
Given(/^I have no actors$/) do
  Actor.count.should == 0 
end

When(/^I create an actor with name "(.*?)" and highest pay "(.*?)" million dollars$/) do |arg1, arg2|
  create_actor arg1, arg2
end            

When(/^I cast "(.*?)" in "(.*?)"$/) do |arg1, arg2|
  tokens = arg1.split(' ')
  a = Actor.find_by_firstname_and_lastname tokens[0], tokens[1]
  m = Movie.find_by_title arg2
  create_acting a, m
end

Then(/^I should see a new actor with firstname "(.*?)" and lastname "(.*?)" and highest pay "(.*?)" million dollars$/) do |arg1, arg2, arg3|
  a = Actor.find_by_firstname_and_lastname arg1, arg2
  a.highest_pay.should == arg3.to_i
end     

Then(/^I should see "(.*?)" as a castmember in movie "(.*?)"$/) do |arg1, arg2|
  tokens = arg1.split(' ')
  a = Actor.find_by_firstname_and_lastname tokens[0], tokens[1]  
  m = Movie.find_by_title arg2
  a.movies.first.title.should == 'twins' 
  m.actors.first.fullname.should == 'Brad Pitt'
end
Then(/^I should see page content: "(.*?)" "(.*?)" "(.*?)"$/) do |arg1, arg2, arg3|
  page.should have_content("#{arg1}") 
  page.should have_content("#{arg2}") 
  page.should have_content("#{arg3}") 
end