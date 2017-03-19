Feature: User log in


  Scenario: An existing user can log in to their account
    Given I have an existing account
    When I go to the root path
    Then I should see "You need to sign in"
    When I fill in "user_email" with "test@example.com"
    And I fill in "user_password" with "password"
    And I press the "Log in" button
    Then I should see "Signed in successfully"
    And I should see "Task list for Test Company"
    And I should not see "Manage users"
    And I should not see "View all tasks"
