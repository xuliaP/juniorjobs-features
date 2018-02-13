Feature: create subscription
  I create the subscription

  Background:
    Given I am on the juniorjobs home page
    Then I see subscription form

  Scenario: Subscribe with valid email
    Given I try to subscribe with valid email
    When I fill the subscription form and submit
    Then redirect to home page
    Then see success message: "Выполнено успешно"

  Scenario: Subscribe with not valid email
    Given I try to subscribe with not valid email
    When I fill the subscription form and submit
    Then redirect to home page
    Then see error message: "имеет неверное значение"

  Scenario: Subscribe with blank email
    Given I try to subscribe without email
    When I fill the subscription form and submit
    Then redirect to home page
    Then see error message: "не может быть пустым"
