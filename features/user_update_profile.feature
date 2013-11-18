Feature: A user can update his profile infos
	As a user
        So that I can update my profile informations

Background: User can update his profile information
Given the following users exist:
	|id| first_name | last_name | email               | password   | password_confirmation |instruc|admin|
	| 1| Sebastian  | Delgado   | sd@gmail.com        | cs169rocks | cs169rocks            |false  |false|

	|2 | Ryan       | Wilson    | hotmale@hotmail.com | ilovebacon | ilovebacon            |false  |false|
        |3 |Aime	| Ngongang  | aime@ngongang.com   | blabla     |blabla                 |true   |false|
        |4 |Alex	|Hu	    |alex@hu.com	  |blabla      |blabla		       |true   |false|
        |5 |admin	|man	    |admin@man.com	  |adminman    |adminman               |false  |true |


Scenario: Update user profile info
    Given I am logged in as "sd@gmail.com" with password "cs169rocks"
    Then I should see "Settings"
    When I follow "Settings"
    And I fill "user_first_name" with "Delgado"
    And I fill "user_last_name" with "Sebastian"
    And I fill "user_email" with "sd@gmail.com"
    And I fill "user_password" with "cs169rocks"
    And I fill "user_password_confirmation" with "cs169rocks"
    And I press "Save changes"
    Then I should see "Profile updated"


Scenario: Invalid update 
    Given I am logged in as "sd@gmail.com" with password "cs169rocks"
    Then I should see "Settings"
    When I follow "Settings"
    And I fill "user_first_name" with "Delgado"
    And I fill "user_last_name" with "Sebastian"
    And I fill "user_email" with "sd@gmail.com"
    And I fill "user_password" with "cs169"
    And I fill "user_password_confirmation" with "cs169"
    And I press "Save changes"
    Then I should see "Invalid update informations"
    





