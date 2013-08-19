Given(/^I have no movies$/) do
  Movie.count.should == 0
end               
When(/^I create a movie with title, description, category, year, and gross data: "(.*?)", "(.*?)", "(.*?)", "(.*?)", "(.*?)"$/) do |arg1, arg2, arg3, arg4, arg5|
  c = Category.find_by_name arg3 
  c.nil? ? cid = nil : cid = c.id
  Movie.create({ title: arg1, description: arg2, year: arg4, gross: arg5, category_id: cid })
end 
Then(/^I should see a new movie with "(.*?)" and "(.*?)", with "(.*?)" and "(.*?)"$/) do |arg1, arg2, arg3, arg4|
  m = Movie.find_by_title(arg1)       
  m.should_not be_nil 
  m.description.should =~ /description of #{arg1}|#{arg2}/
  m.gross.should == 50
  m.year.should == 1982
end    
Then(/^I should not have a new movie with "(.*?)"$/) do |arg1|
  Movie.find_by_title(arg1).should_not be_true
end