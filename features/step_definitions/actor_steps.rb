#Given(/^I fill in firstname with "(.*?)", lastname "(.*?)" and payment "(.*?)" million dollars$/) do |arg1, arg2, arg3|
#  fill_in('actor[firstname]', :with => arg1)               
#  fill_in('actor[lastname]', :with => arg2) 
#  fill_in('actor[actings_attributes][0][payment]', :with => arg3) 
#end   
Given(/^I fill in firstname with "(.*?)", lastname "(.*?)"$/) do |arg1, arg2|
  fill_in('actor[firstname]', :with => arg1)               
  fill_in('actor[lastname]', :with => arg2) 
end
Given(/^I have an actor with name "(.*?)"$/) do |arg1|
  create_actor arg1
end
Given(/^I have actor "(.*?)" getting payment "(.*?)" for "(.*?)"$/) do |arg1, arg2, arg3|     
  a = create_actor( arg1 )
  steps %Q{
    Given I have a year "2005" "drama" movie "#{arg3}" with description "blah" with gross "300"
  }  
  create_acting a, Movie.find_by_title(arg3), arg2
end 
Given(/^I have an actor "(.*?)" who made "(.*?)" in a "(.*?)" \(of desc "(.*?)"\) titled "(.*?)" \(of desc "(.*?)"\), which made "(.*?)" in "(.*?)"$/) do |arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8|
  tokens = arg1.split(' ')
  steps %Q{
    Given I have an actor with name "#{arg1}"
    Given I have "#{arg3}" category with description "#{arg4}"
    Given I have a year "#{arg8}" "#{arg3}" movie "#{arg5}" with description "#{arg6}" with gross "#{arg7}"
    Given I have actor "#{arg1}" getting payment "#{arg2}" for "#{arg5}"                                                                                   
  } 
end

Given(/^I have no actors$/) do
  Actor.count.should == 0 
end
Given(/^I select the remove checkbox for "(.*?)"$/) do |arg1|
  check('actor[actings_attributes][0][_destroy]')
end
When(/^I create an actor with name "(.*?)"$/) do |arg1|
  create_actor arg1
end            

When(/^I cast "(.*?)" in "(.*?)" and payment "(.*?)" million dollars$/) do |arg1, arg2, arg3|
  tokens = arg1.split(' ')
  a = Actor.find_by_firstname_and_lastname tokens[0], tokens[1]
  m = Movie.find_by_title arg2
  create_acting a, m, arg3
end

Then(/^I should see a new actor with firstname "(.*?)" and lastname "(.*?)"$/) do |arg1, arg2|
  a = Actor.find_by_firstname_and_lastname arg1, arg2    
end
Then(/^I should see a new actor with firstname "(.*?)" and lastname "(.*?)" and payment "(.*?)" million dollars$/) do |arg1, arg2, arg3|
  a = Actor.find_by_firstname_and_lastname arg1, arg2    
  a.actings.where(:payment, arg3).should be_true
end     

Then(/^I should see "(.*?)" as a castmember in movie "(.*?)" and payment "(.*?)" million dollars$/) do |arg1, arg2, arg3|
  tokens = arg1.split(' ')
  a = Actor.find_by_firstname_and_lastname tokens[0], tokens[1]  
  m = Movie.find_by_title arg2
  a.movies.first.title.should == 'twins' 
  m.actors.first.fullname.should == 'Brad Pitt' 
  a.actings.where(:payment, arg3).should be_true
end
