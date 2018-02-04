Feature: JuniorJobs admin dashboard
  In order to use admin dashboard
  As a admin
  I need to login

  Background:
    Given I logged in as admin
    And I am on the juniorjobs admin_dashboard page

  Scenario: Admin can see admin layout
    Given I see admin layout

  Scenario: Admin can see users list
    Given 5 default users exists
    When user click users
    Then I see users list

  Scenario: Admin can see subscription list
    Given 3 default subscriptions exists
    When user click subscriptions
    Then I see subscriptions list

  Scenario: Admin can see jobs list
    Given 10 default vacancies exists
    When user click jobs
    Then I see jobs list
