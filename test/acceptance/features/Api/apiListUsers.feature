Feature: list users
  As an admin user
  I want to view the list of users
  So that I can manage users

Scenario: Admin user should be able to see list of created users
  Given the admin has created the following users
    | login | last name | password |
    | Harry | Potter    | hello123 |
  When the admin gets the list of all users using the API
  Then the response status code should be "200"
  And the users list returned by API should be following:
    | login    | last name  |
    | dolibarr | SuperAdmin |
    | Harry    | Potter     |

Scenario: Non-admin users should not be able to see the list of users
  Given the admin has created the following users
    | login | last name | password |
    | Harry | Potter    | hello123 |
  When user "Harry" with password "hello123" tries listing all users using the API
  Then the response status code should be "401"
  And the response message should be "Unauthorized: You are not allowed to read list of users"