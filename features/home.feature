Feature: Home

Scenario: Home Welcome
  Given the app has launched
  When I do nothing
  Then I should see "Welcome"

Scenario: Login Button
  Given the app has launched
  When I do nothing
  Then I should see the button "Login"

Scenario: Register Button
  Given the app has launched
  When I do nothing
  Then I should see the button "Register"
  