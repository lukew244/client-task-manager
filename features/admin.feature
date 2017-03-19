Feature: admin features

  Background:
    Given I have an existing account
    And I am an admin
    And I am logged in

  Scenario: A logged in Admin can manage users
    When I go to the root path
    And I click the "Manage users" link
    Then I should be on the "/users" page
    And I should see "Test Company"
    And I should see "Add a user"

  @wip
  Scenario: A logged in Admin user can create tasks for other accounts
    When I go to the root path
