Feature: Delete vacancy
    Owner can delete his vacancy
    
  Background:
    Given user logged in as company 
    And user have published vacancy

       
    Scenario: Delete user vacancy
      Given user redirect to vacancy page
      And User clic on delete button 
      Then User redirect to root url
