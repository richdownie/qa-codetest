@terms_of_service
Feature: Users are able to visit and research the terms of service page in multiple languages

  Scenario: Visit the terms of service page and verify effective as of date
    Given Open the app url
    When Click on "TERMS OF USE" link
    Then Should see "Effective as of" on the page
    Then Should be on the "/us/en/legal/terms-of-use.html" page
    And Verify the Effective as of Date is equal to today

  Scenario: Visit the terms of service page and verify the available languages
    Given Open the app url
    And Click on "TERMS OF USE" link
    When Click open the language picker
    Then Should see "Français" on the page
    And Should see "Deutsch" on the page
    And Should see "中文" on the page
    And Should see "日本語" on the page
    And Should see "Español" on the page
    And Should see "Italiano" on the page
