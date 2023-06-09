//#Important! Click the "generate tests" button if you have made any changes to this file.

//#Read more about Gherkin syntax https://cucumber.io/docs/gherkin/reference/
//#Read more about bdd_widget_test package https://pub.dev/packages/bdd_widget_test 

//#Example of BDD(Gherkin) syntax:
//#
//#Feature: Counter
//#  Scenario: Initial counter value is 0
//#    Given the app is running
//#    Then I see {'0'} text

Feature: Counter Increment Feature

Scenario: Decrement the counter by 1
  Given I have launched the Brocolis App
  Then I see the counter value as 0
  When I tap the "-" button
  Then I see the counter value as -1

