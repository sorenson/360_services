Feature: Manage Metrics
  In order to value
  As a role
  I want feature

Scenario: See Total Plays
  Given I am logged in
  Then the total plays should be "39"

Scenario: See Storage Used
  Given I am logged in
  Then the storage used should be "13255511.0"
  
Scenario: See all metrics
  Given I am logged in
  And I get all metrics
  Then the events list should contain an event with a day of "2009-12-17"





