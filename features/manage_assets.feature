Feature: Manage Assets
  In order to value
  As a role
  I want feature

Scenario: Get a list of asset guids by passing a tag name
  Given I am logged in
  And I get all assets
  Then the assets list should contain a asset with a id of "e036f43c-2a9f-407f-bc26-19af2b89d222"
  
Scenario: Save an asset
  Given I am logged in
  And I get the asset with id "e036f43c-2a9f-407f-bc26-19af2b89d222"
  When I change the asset attribute "description" to "new description"
  And I save the asset
  And I reload the asset
  Then the asset's description should be "new description"
  Then I change the asset attribute "description" to "description"
  And I save the asset
  
Scenario: Get asset
  Given I am logged in
  And I get the asset with id "e036f43c-2a9f-407f-bc26-19af2b89d222"
  Then the asset attribute "name" should be "test.mp4"

Scenario: Get asset count
  Given I am logged in
  Then the asset count should be "66"
  
Scenario: Get asset presets
  Given I am logged in
  And I get the asset with id "e036f43c-2a9f-407f-bc26-19af2b89d222"
  Then the preset xml should contain "MP4-squish-007.xss"
  
Scenario: Activate and Deactivate
  Given I am logged in
  And I get the asset with id "e036f43c-2a9f-407f-bc26-19af2b89d222"
  When I deactivate the asset
  And I get all assets
  Then the assets list should not contain the asset id
  When I activate the asset
  And I get all assets
  Then the assets list should contain a asset with a id of "e036f43c-2a9f-407f-bc26-19af2b89d222"
  
Scenario: Delete an asset
  Given I am logged in
  And I get the asset with id "e036f43c-2a9f-407f-bc26-19af2b89d222"
  When I delete the asset
  And I get all assets
  Then the assets list should not contain the asset id
  When I undelete the asset
  And I get all assets
  Then the assets list should contain a asset with a id of "e036f43c-2a9f-407f-bc26-19af2b89d222"
  


Scenario: Get asset embed codes
  Given I am logged in
  And I get the asset with id "e036f43c-2a9f-407f-bc26-19af2b89d222"
  Then the asset embed codes should contain "flash_media_loader.swf"
