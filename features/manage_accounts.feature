Feature: Manage accounts through the api
  In order to value
  As a role
  I want feature

Scenario: Login to Sorenson 360 Account
  Given I am logged in with "integrum@integrumtech.com" and "integrum"
  Then  the account attribute "id" should be "db786013-c786-4511-8a0d-73f1bacc2285"
  
Scenario: Get an account
  Given I am logged in
  And I get an account
  Then the account attribute "status" should be "Live"
  
# Scenario: Change password
#   Given I am logged in with "integrum@integrumtech.com" and "newpass"
#   When I change my password to "integrum"
#   Then I should be able to log in with "integrum@integrumtech.com" and "integrum"
#   When I change my password to "newpass"
#   Then I should be able to log in with "integrum@integrumtech.com" and "newpass"
  
@wip
Scenario: Empty trash
  Given I am logged in
  And I get an account
  And I create an asset
  And I delete the asset
  When I empty the trash
  Given I get all assets
  Then the asset list should not include the asset
  
  