Feature: Register

Scenario: Register Screen
  Given I press "Register"
  When I do nothing
  Then I should see "Register"

Scenario: Email TextField
  Given I press "Register"
  When I do nothing
  Then I should see "email"

Scenario: Password TextField
  Given I press "Register"
  When I do nothing
  Then I should see "mot de passe"

Scenario: Password Copy TextField
  Given I press "Register"
  When I do nothing
  Then I should see "recopy mot de passe"

Scenario: Register Button
  Given I press "Register"
  When I do nothing
  Then I should see "Register"

Scenario: Fermer Button
  Given I press "Register"
  When I do nothing
  Then I should see "Fermer"

Scenario: No Valid form without info
  Given I press "Register"
  When I press "Register"
  Then I should see "Please, add a email and a password"

Scenario: No Valid form without valid email
  Given I press "Register"
  When I use the native keyboard to enter "mail@mail" into the "email" input field
  Then I touch done
  And I press "Register"
  And I should see "Please, add a validate email"

Scenario: No Valid form with small password
  Given I press "Register"
  When I use the native keyboard to enter "mail@mail.fr" into the "email" input field
  And I use the native keyboard to enter "123" into the "mot de passe" input field
  Then I touch done
  And I press "Register"
  Then I should see "Please, enter a password sup to 3 char"

Scenario: No Valid form with small password
  Given I press "Register"
  When I use the native keyboard to enter "mail@mail.fr" into the "email" input field
  And I use the native keyboard to enter "1234" into the "mot de passe" input field
  And I use the native keyboard to enter "1235" into the "recopy mot de passe" input field
  Then I touch done
  And I press "Register"
  Then I should see "Your password its not same"

Scenario: Success login
  Given I press "Register"
  When I use the native keyboard to enter "mail@mail.fr" into the "email" input field
  And I use the native keyboard to enter "1234" into the "mot de passe" input field
  And I use the native keyboard to enter "1234" into the "recopy mot de passe" input field
  Then I touch done
  And I press "Register"
  Then I should see "Home"