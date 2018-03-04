Feature: display once cv and list

  Scenario: display list cv
    Given 10 default cv exists
    When I am on the juniorjobs home page
    And user click cvs
    Then user see cvs list
    And user see cvs list

  Scenario: display cv on cv page
    Given default cv exists
    When I am on the juniorjobs home page
    And user click cvs
    And user redirect to cvs page
    And user click cv_title
    Then user redirect to cv page
    And user see cv

    Scenario: display cv on own cv page
    Given user logged in as junior
    And default own cv exists
    When I am on the juniorjobs home page
    And user click profile
    And user click own_cvs
    And user redirect to own_cvs page
    And user click cv_title
    Then user redirect to cv page
    And user see cv