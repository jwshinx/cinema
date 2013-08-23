@actor
Feature: Manage Actor

 So that actor activity can be managed
 I want to do stuff with a actor

 @add_actor
  Scenario: Add Actor
   Given I have no actors
   When I create an actor with name "brad pitt"
   Then I should see a new actor with firstname "brad" and lastname "pitt"           

 @add_actor_of_cast
  Scenario: Add Actor of Cast
   Given I have no actors      
   And I have a year "1999" "drama" movie "twins" with description "blah" with gross "20"
   When I create an actor with name "brad pitt"  
   And I cast "brad pitt" in "twins" and payment "20" million dollars
   Then I should see a new actor with firstname "brad" and lastname "pitt" and payment "20" million dollars
   And I should see "brad pitt" as a castmember in movie "twins" and payment "20" million dollars    

 @bara_add_actor
  Scenario: Add Actor of Cast
   Given I have no actors  
   And I have "drama" category with description "blah" 
   And I have a year "2000" "drama" movie "fight club" with description "blah" with gross "200"   
   And I visit new_actor page 
   And I fill in firstname with "brad", lastname "pitt"
   And I select movie "fight club"
   And I fill in payment "20" million dollars
   When I click "Save" 
   Then I should be on the page for "brad pitt"
   And I should see page content: "Brad Pitt" 
   And I should see page content: "$20"           
   And I should see page content: "fight club"           
        
 @bara_remove_movie
  Scenario: Remove Actor of Cast
   Given I have an actor "brad pitt" who made "20" in a "drama" (of desc "blah") titled "fight club" (of desc "blah"), which made "300" in "2005"      
   And I visit edit_actor page for "brad pitt" 
   And I select the remove checkbox for "fight club"
   When I click "Save" 
   Then I should be on the page for "brad pitt"
   And I should see page content: "Brad Pitt"
   And I should not see page content: "fight club"                 

 @total_earned
  Scenario: Earned Total of Actor
   Given I have an actor "brad pitt" who made "20" in a "drama" (of desc "blah") titled "fight club" (of desc "blah"), which made "300" in "2000"      
   And I have an actor "brad pitt" who made "20" in a "drama" (of desc "blah") titled "seven" (of desc "blah"), which made "300" in "2005"      
   And I have an actor "brad pitt" who made "20" in a "drama" (of desc "blah") titled "tree" (of desc "blah"), which made "300" in "2007"      
   And I visit show_actor page for "brad pitt" 
   Then I should be on the page for "brad pitt" 
   And I should see page content: "60"

           

 