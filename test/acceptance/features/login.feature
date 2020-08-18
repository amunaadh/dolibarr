Feature : user login
  As a/an user/admin
  I want to login to my account
  So that I can access my functionalities

  Background:
    Given the user has browsed to the login page

  Scenario : Admin users should be able to login successfully
    When user enters username "dolibarr" and password "password"
    And user clicks the login button
    Then the user should be logged in successfully

  Scenario : Admin users with empty fields should not be able to login
    When user enters username "" and password ""
    And user clicks the login button
    Then the user should not be logged in successfully

  Scenario Outline: User logs in with invalid credentials
    When user enters username "<username>" and password "<password>"
    And user clicks the login button
    Then error message "Bad value for login or password" should be displayed
    And the user should not be logged in successfully
    Examples:
      | username | password |
      | dolibar  | pasword  |
      | dolibarr | pasword  |
      | dolibarr |          |
      | dolibar  |          |
      | dolibar  | password |


#Scenario : Admin users with wrong credentials should not be able to login successfully
##Given user has browsed to the login page
#When user enters username "dolibar" and password "pasword"
#And user clicks the login button
#Then the user should not be logged in successfully
#
#Scenario : Admin users with empty fields should not be able to login
##Given user has browsed to the login page
#When user enters username "" and password ""
#And user clicks the login button
#Then the user should not be logged in successfully
#
#Scenario : Admin users with password field empty should not be able to login
##Given user has browsed to the login page
#When user enters username "dolibarr" and password ""
#And user clicks the login button
#Then error message "Bad value for login or password" should be displayed
#And the user should not be logged in successfully

