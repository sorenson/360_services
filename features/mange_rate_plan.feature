Feature: Mange rate plan
  In order to value
  As a role
  I want feature

Scenario: Get the rate plan
  Given I am logged in
  And I get the rate plan
  Then the rate plan attribute "rate plan type" should be "RATE_PLAN_BASIC"