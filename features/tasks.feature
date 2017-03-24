Feature: tasks

  Scenario: A logged in user can create, update and delete a task
    Given I have an existing account
    And I am logged in
    When I go to the root path
    And I click the "Add a task" link
    Then I should be on the "/tasks/new" page
    And I should not see "Company"
    When I fill in "task_person" with "My name"
    And I fill in "description-textarea" with "A relevant task"
    And I select "in progress" from "task_status"
    And I press the "Create task" button
    Then I should be on the "/" page
    And I should see "A relevant task"
    When I click the "Edit" link
    Then I should see "Update task"
    When I fill in "task_person" with "A new name"
    And I fill in "description-textarea" with "An update to the task"
    And I press the "Create task" button
    Then I should be on the "/" page
    And I should see "An update to the task"
    When I click the "Delete" link
    Then I should see "Task deleted successfully"
    And I should not see "A relevant task"
