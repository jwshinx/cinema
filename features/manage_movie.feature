@movie
Feature: Manage Movie

 So that movie activity can be managed
 I want to do stuff with a movie

 @add_movie
  Scenario Outline: Add Movie
   Given I have no movies
   And I have "comedy" category with description "blah" 
   When I create a movie with title, description, category, year, and gross data: "<title>", "<description>", "<category>", "<year>", "<gross>"
   Then I should see a new movie with "<title>" and "<description>", with "<year>" and "<gross>"    

   Scenarios: Movie input data
   | title   | description | category | year | gross |
   | fletch  | fblah       | comedy   | 1982 | 50    | 
   | fletch  |             | comedy   | 1982 | 50    |                     

 @invalid_movie
  Scenario Outline: Invalid Movie
   Given I have no movies
   And I have "comedy" category with description "blah" 
   When I create a movie with title, description, category, year, and gross data: "<title>", "<description>", "<category>", "<year>", "<gross>"
   Then I should not have a new movie with "<title>"    

   Scenarios: Invalid movie input data
   | title   | description | category | year | gross |
   |         | blah        | comedy   | 1982 | 50    |
   | fletch  | blah        |          | 1982 | 50    |
   | fletch  | blah        | comedy   |      | 50    |  
   | fletch  | blah        | comedy   | 1982 |       |