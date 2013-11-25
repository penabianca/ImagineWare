Feature: An admin can see all the students, all the instructors, he can delete either instructors or students
	As an administrator
        So that I can delete unauthorized users

Background: Admin can delete unauthorized users, either students or instructors
Given the following users exist:
	|id| first_name | last_name | email               | password   | password_confirmation |instruc|admin|status|
	| 1| Sebastian  | Delgado   | sd@gmail.com        | cs169rocks | cs169rocks            |false  |false|approved|

	|2 | Ryan       | Wilson    | hotmale@hotmail.com | ilovebacon | ilovebacon            |false  |false|approved|
        |3 |Aime	| Ngongang  | aime@ngongang.com   | blabla     |blabla                 |true   |false|approved|
        |4 |Alex	|Hu	    |alex@hu.com	  |blabla      |blabla		       |true   |false|approved|
        |5 |admin	|man	    |admin@man.com	  |adminman    |adminman               |false  |true |approved|


Scenario: View all the students
    Given I am logged in as "admin@man.com" with password "adminman"
    Then I should see "All Students"
    When I follow "All Students"
    Then I should see 2 students

Scenario: view all the instrutors
    Given I am logged in as "admin@man.com" with password "adminman"
    Then I should see "All instructors"
    When I follow "All instructors"
    Then I should see 2 instructors

Scenario: A non admin cannot see all instructors
    Given I am logged in as "aime@ngongang.com" with password "blabla"
    Then I should not see "All Instructors"

Scenario: Deleting an invalid student
    Given I am logged in as "admin@man.com" with password "adminman"
    Then I should see "All Students"
    When I follow "All Students"
    Then I should see "delete"
    
    

Scenario: Deleting an invalid instructor
    Given I am logged in as "admin@man.com" with password "adminman"
    Then I should see "All instructors"
    When I follow "All instructors"
    Then I should see "delete"
    
    







