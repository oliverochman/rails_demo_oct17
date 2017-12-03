Feature: List articles on landing pages
  As a visitor,
  when I visit the application's landing page,
  I would like to see a list of articles

  Background:
    Given the following articles exists
      | title                | content                          |
      | Oliver är bäst       | Han är verkligen det             |
      | Learn Rails 5        | Build awesome rails applications |

  Scenario: Viewing list of articles on application's landing page
    When I visit the landing page
    Then I should see "Oliver är bäst"
    And I should see "Han är verkligen det"
    And I should see "Learn Rails 5"
    And I should see "Build awesome rails applications"
