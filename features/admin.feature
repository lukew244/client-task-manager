Feature: admin features

  Background:
    Given I have an existing account
    And there is a client account
    And I am an admin
    And I am logged in

  Scenario: A logged in Admin can manage users
    When I go to the root path
    And I click the "Manage users" link
    Then I should be on the "/users" page
    When I click the "Add a user" link
    And I fill in "user_email" with "client@example.com"
    And I fill in "user_password" with "password"
    And I fill in "user_password_confirmation" with "password"
    And I fill in "user_company" with "Client Company"
    And I press the "Create User" button
    Then I should be on the "/users" page
    And I should see "client@example.com"
    And I should see "Client Company"


  Scenario: A logged in Admin user can create tasks on other accounts
    When I go to the root path
    And I click the "View all tasks" link
    And I click the "Add a task" link
    When I fill in "task_person" with "A client name"
    And I fill in "description-textarea" with "A relevant task"
    And I select "pending" from "task_status"
    And I select "Client Company" from "task_company"
    And I press the "Create task" button
    Then I should be on the "admin/tasks" page
    And I should see "Client Company"
    And I should see "A relevant task"
