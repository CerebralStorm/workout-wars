Feature: Workouts
  As a registered user, I should be able to create, update, edit and destroy, workouts

  Background:
    Given there is a user "ray@bustinghosts.com" with password "slimer-Ecto-1"
    And there is an existing workout
    And database is seeded
    And I am logged in as "ray@bustinghosts.com" with password "slimer-Ecto-1"
    And I visit the workouts pages

  @javascript
  Scenario: Create a new workout
    When I click on "new-workout-link"
    And I select a date and activity
    And I fill out the form with the following attributes:
      | workout[exercises_attributes][0][reps]  | 30  |
      | workout[exercises_attributes][0][sets]  | 3   |
    And I click on "save-workout-link"
    Then I should see a success message

  @javascript
  Scenario: Edit a new workout
    When I click on "edit-workout-link"
    And I fill out the form with the following attributes:
      | workout[exercises_attributes][0][reps]  | 25  |
      | workout[exercises_attributes][0][sets]  | 4   |
    And I click on "save-workout-link"
    Then I should see an update message
    And the workout totals should be changed