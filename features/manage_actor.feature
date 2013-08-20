@actor
Feature: Manage Actor

 So that actor activity can be managed
 I want to do stuff with a actor

 @add_actor
  Scenario: Add Actor
   Given I have no actors
   When I create an actor with name "brad pitt" and highest pay "20" million dollars
   Then I should see a new actor with firstname "brad" and lastname "pitt" and highest pay "20" million dollars           

 @add_actor_of_cast
  Scenario: Add Actor of Cast
   Given I have no actors      
   And I have a year "1999" "drama" movie "twins" with description "blah" with gross "20"
   When I create an actor with name "brad pitt" and highest pay "20" million dollars    
   And I cast "brad pitt" in "twins"
   Then I should see a new actor with firstname "brad" and lastname "pitt" and highest pay "20" million dollars
   And I should see "brad pitt" as a castmember in movie "twins"    

 @bara_add_actor
  Scenario: Remove Actor of Cast
   Given I have no actors      
   And I visit new_actor page 
   And I fill in firstname with "brad", lastname "pitt" and highest paid "20"
   When I click "Save" 
   Then I should be on the page for "brad pitt"
   And I should see page content: "brad" "pitt" "20"           
        

 