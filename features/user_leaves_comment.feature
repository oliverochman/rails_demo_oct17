Feature: User leaves comment on article
  As a visitor,
  In order to be able to express my opinions about an article
  I would like to be able to cemment

  Background:
    Given the following articles exists
      | title                | content                          |
      | Oliver är bäst       | Han är verkligen det             |
      | Learn Rails 5        | Build awesome rails applications |

  Scenario: User leaves a comment
    Given I am on the show page for article "Oliver är bäst"
    When I fill in "body" with "Great article"
    And I fill in "email" with "Hotmale@hotmail.com"
    And I click "Save" button
    Then I should be on the show page for article "Oliver är bäst"
    And I should see "Comment has been posted"
    And I should see "Great article"
    And I should see "Hotmale@hotmail.com"

  Scenario: User leaves a comment without an email
    Given I am on the show page for article "Oliver är bäst"
    When I fill in "body" with "Great article"
    And I click "Save" button
    Then I should be on the show page for article "Oliver är bäst"
    And I should see "Comment has been posted"
    And I should see "Great article"

  Scenario: User leaves a comment with blank body [Sad path]
    Given I am on the show page for article "Oliver är bäst"
    When I fill in "body" with ""
    And I fill in "email" with "Hotmale@hotmail.com"
    And I click "Save" button
    Then I should be on the show page for article "Oliver är bäst"
    And I should see "Body can't be blank"

  Scenario: User leaves a comment with invalid [Sad path]
    Given I am on the show page for article "Oliver är bäst"
    When I fill in "body" with "Great Article"
    And I fill in "email" with "Hotmale@hotmail.c"
    And I click "Save" button
    Then I should be on the show page for article "Oliver är bäst"
    And I should see "Invalid email"
