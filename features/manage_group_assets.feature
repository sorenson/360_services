Feature: Manage group assets
  In order to value
  As a role
  I want feature
  
Background:
  Given I am logged in
  And I get the first asset
  And I find the group with the name "my group"
  Then I delete the group if it was found

Scenario: Add an asset to a group
  And I create a group named "my group"
  When I add the asset to the group
  And I reload the group
  Then the asset should be in the group
   
Scenario: Get the asset groups
  And I create a group named "my group"
  And I add the asset to the group
  When I reload the asset
  Then the asset should have the group
  
Scenario: Get group assets
  Given I am logged in
  And I get the first asset
  And I create a group named "my group"
  And I add the asset to the group
  And I reload the group
  Then the group should have the asset

