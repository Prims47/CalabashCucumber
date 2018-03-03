Feature: Login

Scenario: Login Screen
  Given I press "Login"
  When I do nothing
  Then I should see "Login"

Scenario: Email TextField
  Given I press "Login"
  When I do nothing
  Then I should see "email"

Scenario: Password TextField
  Given I press "Login"
  When I do nothing
  Then I should see "mot de passe"

Scenario: Login Button
  Given I press "Login"
  When I do nothing
  Then I should see "Login"

Scenario: Fermer Button
  Given I press "Login"
  When I do nothing
  Then I should see "Fermer"

Scenario: Fermer Button action
  Given I press "Login"
  When I press "Fermer"
  Then I should see "Welcome"

Scenario: No Valid form without info
  Given I press "Login"
  When I press "Login"
  Then I should see "Please, add a email and a password"

Scenario: No Valid form without valid email
  Given I press "Login"
  When I use the native keyboard to enter "mail@mail" into the "email" input field
  Then I touch done
  And I press "Login"
  And I should see "Please, add a validate email"

Scenario: No Valid form with small password
  Given I press "Login"
  When I use the native keyboard to enter "mail@mail.fr" into the "email" input field
  And I use the native keyboard to enter "123" into the "mot de passe" input field
  Then I touch done
  And I press "Login"
  And I should see "Please, enter a password sup to 3 char"

Scenario: Email and password not match
  Given I press "Login"
  When I use the native keyboard to enter "mail@mail.fr" into the "email" input field
  And I use the native keyboard to enter "1235" into the "mot de passe" input field
  Then I touch done
  And I press "Login"
  Then I should see "Login and password dont match"

Scenario: Success login
  Given I press "Login"
  When I use the native keyboard to enter "mail@mail.fr" into the "email" input field
  And I use the native keyboard to enter "1234" into the "mot de passe" input field
  Then I touch done
  And I press "Login"
  And I should see "Home"