Feature: Manage Metadata
  In order to value
  As a role
  I want feature
  
Scenario: Add metadata to asset and find it
  Given I am logged in
  And I get the first asset
  And I add the metadata "key" with the value "value" to the asset
  When I reload the asset
  Then the asset metadata value for "key" should be "value"
  
Scenario: Delete metadata
  Given I am logged in
  And I get the first asset
  And I add the metadata "key" with the value "value" to the asset
  When I delete the metadata key "key"
  And I reload the asset
  Then the asset should not have a metadata value for "key"
  
Scenario: Get all metadata
  Given I am logged in
  And I get the first asset
  And I add the metadata "color" with the value "blue" to the asset
  And I add the metadata "size" with the value "medium" to the asset
  And I get all the metadata for the asset
  Then the metadata for the asset should contain "color=blue"
  And the metadata for the asset should contain "size=medium"
