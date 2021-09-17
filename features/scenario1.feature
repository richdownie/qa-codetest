@authentication
Feature: Users are presented an error message when submitting invalid authentication user credentials

  Scenario: Invalid username
    Given Open the app url
    When Enter some "invalid" credentials
    Then Should see error message "We didn't recognize the username or password you entered. Please try again." on the page
