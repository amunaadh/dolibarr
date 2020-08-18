Feature: user logs out
  As a user
  I want to log out of my account
  So that I can protect my work, identity and be assured of my privacy

  Scenario: Users should be able to logout
    Given the user "dolibarr" is logged in
    When the user opens the user profile
    And the user logs out using the webUI
    Then the user should be logged out of the account

