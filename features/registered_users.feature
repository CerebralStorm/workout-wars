Feature: Authentication
  As a registered user, I should be able to sign up, sign in, sign out, and view my profile

  Background:
    Given there is a user "ray@bustinghosts.com" with password "slimer-Ecto-1"
    And I visit the home page

  Scenario: Sign in with bad credentials
    When I try to log in with the wrong password
    Then I should not be logged in

  Scenario: Sign In
    When I try to log in with the right password
    Then I should be logged in

  Scenario: Sign Out
    When I try to log in with the right password
    And I visit the home page
    And I log out
    Then I should be logged out

  Scenario: Forgot Password
    When I visit the password retrieval page
    Then I should be able to get a password reset email
    And I should be able to change my password to "5tay9uftMan"

  # Scenario: Updated Account with no password
  #   When I try to log in with the right password
  #   And I try to edit my account without entering my current password
  #   Then I should not be able to update my account

  # Scenario: Updated Account
  #   When I try to log in with the right password
  #   And I try to edit my account with my current password
  #   Then I should see a success message

  # Scenario: View My Profile
  #   When I visit my profile page
  #   Then I should see my profile
