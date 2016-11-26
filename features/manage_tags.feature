Feature: Manage Tags
  In order to value
  As a role
  I want feature

Scenario: Add tags to asset
  Given I am logged in
  And I get the first asset
  And I assign the tags "apple orange pear" to the asset
  Then the tags list should contain "apple"
  Then the tags list should contain "orange"
  Then the tags list should contain "pear"

Scenario: Find all assets by tag
  Given I am logged in
  And I get the first asset
  And I assign the tag "apple" to the asset
  And I find all assets with the tag "apple"
  Then the assets list should contain the asset

Scenario: Get asset tags
  Given I am logged in
  And I get the first asset
  And I assign the tag "red" to the asset
  And I get the tags for the asset
  Then the tags list should contain "red"

Scenario: Get tag count
  Given I am logged in
  Then the tag count should be "4"

Scenario: Get all tags
  Given I am logged in
  And I get the first asset
  And I assign the tag "apple" to the asset
  And I get all tags
  Then the tags list should contain "apple"