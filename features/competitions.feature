Feature: Competitions
  As a registered user, I should be able to create, update, edit and destroy, competitions

  Background:
    Given there is a user "ray@bustinghosts.com" with password "slimer-Ecto-1"
    And database is seeded
    And there is an existing competition    
    And I am logged in as "ray@bustinghosts.com" with password "slimer-Ecto-1"
    And I visit the competitions pages

  @javascript
  Scenario: Create a new competition
    When I click on "new-competition-link"
    And I select a startdate and enddate
    And I fill out the form with the following attributes:
      | competition_name              | Billy Bo Bob's Thunder Arena |
      | competition_max_participants  | 30                           |
    And I select "Very Hard" from "competition_difficulty_id"
    And I click on "save-competition-link"
    Then I should see a "Competition" success message

  @javascript
  Scenario: Edit an exisiting competition
    When I click on "edit-competition-link"
    And I fill out the form with the following attributes:
      | competition_name              | Billy Bo Bob's Thunder Dance |
      | competition_max_participants  | 45                           |
    And I click on "save-competition-link"
    Then I should see a "Competition" update message
    And the competition details should be changed

  @javascript
  Scenario: Delete an exisiting workout
    When I click on "delete-competition-link nofollow"
    And I confirm
    Then I should see a "Competition" delete message