Feature: Manage Flags
  In order to value
  As a role
  I want feature

Scenario: List all flags
  Given I am logged in
  When I get the first asset
  And I assign the flags "red blue green" to the asset
  When I get all flags
  Then the flags list should contain "red"

Scenario: List flagged assets
  Given I am logged in
  When I get the first asset
  And I assign the flags "red blue green" to the asset
  When I get all flags
  Then the flags list should contain "red"
  
Scenario: Add flags to asset
  Given I am logged in
  And I get the first asset
  And I assign the flags "red blue green" to the asset
  Then the flags list should contain "red"
  Then the flags list should contain "blue"
  Then the flags list should contain "green"

Scenario: Find all assets by flag
  Given I am logged in
  And I get the first asset
  And I assign the flag "red" to the asset
  And I find all assets with the flag "red"
  Then the assets list should contain "9cf8161e-dea5-40ec-990b-d5d24c0d4191"

Scenario: Get asset flags
  Given I am logged in
  And I get the first asset
  And I assign the flag "pear" to the asset
  And I get the flags for the asset
  Then the flags list should contain "pear"

Scenario: Count flags
  Given I am logged in
  Then the flag count should be "4"