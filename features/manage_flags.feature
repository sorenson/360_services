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

Scenario: Count flags
  Given I am logged in
  Then the flag count should be 4
  
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
  Then the assets list should contain "c67f1fdb-8199-4b5c-921f-d864cf2d903f"

Scenario: Get asset flags
  Given I am logged in
  And I get the first asset
  And I assign the flag "pear" to the asset
  And I get the flags for the asset
  Then the flags list should contain "pear"
