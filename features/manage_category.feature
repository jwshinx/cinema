@category
Feature: Manage Category

 So that category activity can be managed
 I want to do stuff with a category

 @new_category
  Scenario: Add Category
   Given I have no categories
   When I create a "drama" category with description "blah"
   Then I should see a new category with name "drama" and description "blah"