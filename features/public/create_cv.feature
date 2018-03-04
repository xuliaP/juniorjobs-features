Feature: create cv
  I create the cv

  Background:
    Given user logged in as junior
    And I am on the juniorjobs home page
    And user click profile
    And user click own_cvs
    And user redirect to own_cvs page
    And user click add_cv
    Then user redirect to new_cv page

  Scenario Outline:
    Given user have cv <field> with <data>
    When user fill cv form
    And user click submit
    Then user redirect to cv page
    And user see his cv

    Examples:
    | field       | data |
    | title       | 5    |
    | title       | 50   |
    | description | 10   |
    | description | 1200 |

  Scenario Outline: create cv with not valid data
    Given user have cv <field> with <data>
    When user fill cv form
    And user click submit
    Then user see cv form
    And user see error message: <message>

    Examples:
    | field           | data | message                                                       |
    | title           |      | недостаточной длины (не может быть меньше 5 символа)          |
    | title           | 4    | недостаточной длины (не может быть меньше 5 символа)          |
    | title           | 51   | слишком большой длины (не может быть больше чем 50 символа)   |
    | name            |      | недостаточной длины (не может быть меньше 5 символа)          |
    | name            | 4    | недостаточной длины (не может быть меньше 5 символа)          |
    | name            | 51   | слишком большой длины (не может быть больше чем 50 символа)   |
    | description     |      | недостаточной длины (не может быть меньше 10 символа)         |
    | description     | 9    | недостаточной длины (не может быть меньше 10 символа)         |
    | description     | 1201 | слишком большой длины (не может быть больше чем 1200 символа) |
    | phone           |      | не может быть пустым                                          |
    | email           |      | не может быть пустым                                          |
