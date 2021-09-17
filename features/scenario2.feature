@forgot_password
Feature: Users are presented an error message when submitting invalid forgot password user credentials

  Scenario: Enter a blank email address
    Given Open the app url
    And Click on "FORGOT PASSWORD?" link
    When Click on "SUBMIT" button
    Then Should see "Error: Email address required" on the page

  Scenario: Enter an invalid email address
    Given Open the app url
    And Click on "FORGOT PASSWORD?" link
    And Enter an invalid email address
    When Click on "SUBMIT" button
    Then Should see "Error: Invalid email address" on the page
