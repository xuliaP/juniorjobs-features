Feature: Delete vacancy
    Owner can delete his vacancy
    
  Background:
    Given user logged in as company 
    And user have published vacancy

       
    Scenario: Delete user vacancy
      Given I am on the juniorjobs edit_vacancy page
      And user click delete_job 
      Then User redirect to root url
