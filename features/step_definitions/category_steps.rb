Given(/^I have no categories$/) do
  Category.count == 0
end               

Given(/^I have "(.*?)" category with description "(.*?)"$/) do |arg1, arg2|
  c = Category.create name: arg1, description: arg2
  c.name.should == arg1
end
When(/^I create a "(.*?)" category with description "(.*?)"$/) do |arg1, arg2|
  Category.create( {name: arg1, description: arg2}) 
end
Then(/^I should see a new category with name "(.*?)" and description "(.*?)"$/) do |arg1, arg2|
  c = Category.find_by_name(arg1)
  c.name.should == arg1
  c.description.should == arg2 
end