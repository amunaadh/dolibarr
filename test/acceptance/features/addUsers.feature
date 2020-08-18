Feature: add users
  As an admin
  I want to add users
  So that authorised access is given

  Background:
    Given the admin has logged in using the webUI
    And the admin has browsed to the new users page

  Scenario: Admin adds users with no permission
    When the admin creates user with following details
      | lastname      | Adhikari      |
      | email         | abc@gmail.com |
      | password      | password      |
      | administrator | No            |
    Then message "This user has no permission defined" should be displayed
    And  new user "Adhikari" should be created

  Scenario Outline: Admin adds users with permission
    When the admin creates user with following details
      | lastname      | Adhikari        |
      | email         | abc@gmail.com   |
      | password      | password        |
      | administrator | <administrator> |
      | gender        | <gender>        |
    Then message "This user has no permission defined" <shouldOrShouldnot> be displayed
    And new user "Adhikari" should be created
    Examples:
      | administrator | gender | shouldOrShouldnot |
      | no            |        | should            |
      | no            | man    | should            |
      | no            | woman  | should            |
      | yes           |        | shouldnot         |
      | yes           | man    | shouldnot         |
      | yes           | woman  | shouldnot         |

  Scenario Outline: Admin adds user with incomplete credentials
    When the admin creates user with following details
      | lastname | <lastname> |
      | email    | <email>    |
      | password | <password> |
    Then message "<message>" should be displayed
    And new user "<lastname>" should not be created
    Examples:
      | lastname | email         | password | message                                   |
      |          |               |          | Name is not defined. Login is not defined |
      | Adhikari |               | abc      | Login is not defined                      |
      |          | abc@gmail.com | abc      | Name is not defined                       |
      | Adhikari | abc@gmail.com |          | The user has no permission defined        |
      | assd     |               |          | Login is not defined                      |

  Scenario Outline: Admin adds users with special character
    When the admin creates user with following details
      | lastname | email         | password | administrator   | gender   |
      | #$#4er   | abc@gmail.com | abc      | <administrator> | <gender> |
      | 1234     | 12            | ab       | <administrator> | <gender> |
    Then message "This user has no permission defined" <shouldOrShouldnot> be displayed
    And new user "Adhikari" should be created
    Examples:
      | administrator | gender | shouldOrShouldnot |
      | no            |        | should            |
      | no            | man    | should            |
      | no            | woman  | should            |
      | yes           |        | shouldnot         |
      | yes           | man    | shouldnot         |
      | yes           | woman  | shouldnot         |

  @issue
  Scenario: Admin adds user with incomplete credentials
    When the admin creates user with following details
      | lastname | Adhikari      |
      | email    | abc@gmail.com |
      | password |               |
    Then message "The user has no permission defined" should be displayed
    And new user <Adhikari> should not be created






