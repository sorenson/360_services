Feature: Manage Sites
  In order to value
  As a role
  I want feature

Scenario: Create a site and view list
  Given I am logged in
  When I create a new site with the name "new site name" and the description "new site description"
  And I get all sites
  Then the sites list should contain "new site name"

Scenario: Get a site by name
  Given I am logged in
  When I create a new site with the name "new site name" and the description "new site description"
  And I get the site named "new site name"
  Then the site attribute "id" should be "b8453bf0-fe23-012c-3e4c-0026bb5241fa"
