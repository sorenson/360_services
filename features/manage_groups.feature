Feature: Manage groups
  In order to value
  As a role
  I want feature

Background:
  Given I am logged in
  And I find the group with the name "my group"
  Then I delete the group if it was found

Scenario: Create a group
  When I create a group named "my group"
  Then the group's name should be "my group"

Scenario: Find a group by id
  When I create a group named "my group"
  Then I should be able to find the group
  
Scenario: Get all groups
  And I create a group named "my group"
  And I get all groups
  Then the group list should contain the group
  
Scenario: Delete a group
  When I create a group named "delete me"
  And I reload the group
  And I delete the group
  And I get all groups
  Then the groups list should not contain the group id
