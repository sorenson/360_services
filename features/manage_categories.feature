Feature: Manage categories
  In order to value
  As a role
  I want feature

Scenario: Add a category to an asset
  Given I am logged in
  And I get the first asset
  And I assign the category "new category" to the asset
  Then the category attribute "name" should be "new category"

Scenario: Remove a category from an asset
  Given I am logged in
  And I get the first asset
  And I assign the category "new category" to the asset
  And I remove the category from the asset
  Then the asset should not have a category

Scenario: See the asset category
  Given I am logged in
  And I get the first asset
  And I assign the category "asset category" to the asset
  When I get the category
  Then the category attribute "name" should be "asset category"

Scenario: See all categories
  Given I am logged in
  When I create a category named "category1"
  And I get all categories
  Then the categories list should contain "category1"

Scenario: Find a category
  Given I am logged in
  When I create a category named "category1"
  And I find the category named "category1"
  Then the category attribute "name" should be "category1"

Scenario: Create a category
  Given I am logged in
  When I create a category named "category1"
  Then the category attribute "name" should be "category1"

Scenario: Save a category
  Given I am logged in
  When I create a category named "category1"
  And I change the category attribute "description" to "moocow"
  And I save the category
  When I find the category named "category1"
  Then the category attribute "description" should be "moocow"

Scenario: Add a sub category
  Given I am logged in
  When I create a category named "category1"
  And I create a category named "child of category 1"
  And I change the category attribute "parent" to "category1"
  And I save the category
  When I find the category named "child of category 1"
  Then the parent of the category should be "category1"

Scenario: Delete a category
  Given I am logged in
  And I create a category named "category1"
  And I get all categories
  Then the categories list should contain "category1"
  When I delete the category
  And I get all categories
  Then the categories list should not contain "category1"

Scenario: See all assets belonging to a category
  Given I am logged in
  And I get the first asset
  And I assign the category "my category" to the asset
  And I find the category named "my category"
  When I get the category assets
  Then the assets list should contain the asset

Scenario: List root categories
  Given I am logged in
  And I create a category named "cat1"
  And I create a category named "cat1 child"
  And I change the category attribute "parent" to "cat1"
  And I save the category
  And I get the root categories
  Then the categories list should contain "cat1"
  And the categories list should not contain "cat1 child"

