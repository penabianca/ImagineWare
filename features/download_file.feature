Feature: Download a students solutions for the course
	As an ImagineWare instructor
	I want to download a file with as students solutions to the course
	So that his code can be graded

Background: There are courses on the database and the user is logged in

	Given the following courses exist:
	| title                       | tags     | content                                                        |
	| Introduction to HTML5       | web      | This is and HTML5 course. You must build a website from sratch |
	| Advanced Android            | advanced | Here you will build a sick android app. Strap up!              |
	| Object Oriented Programming | beginner | Here you must build classes with inheretance in Java           |

	Given the following users exist:
	|id| first_name | last_name | email               | password   | password_confirmation |instruc|admin| status   |
	|1 | Sebastian  | Delgado   | sd@gmail.com        | cs169rocks | cs169rocks            |false  |false| approved |
	|2 | Ryan       | Wilson    | hotmale@hotmail.com | ilovebacon | ilovebacon            |false  |false| approved |
        |3 | Aime	| Ngongang  | aime@ngongang.com   | blabla     | blabla                |true   |false| approved |


Scenario: An Admin wants to download the file associated to a submission
	Given that sd@gmail.com is logged in with password cs169rocks
	Given I am on the "Introduction to HTML5" course page
	When I attach an html file
	When I press "Upload"
	When I press "submit assignment"
	When I follow "Sign out"

	Given that aime@ngongang.com is logged in with password blabla
	When I follow "All Students"
	When I follow "Sebastian Delgado"
	When I follow "Download Assignment"
	Then I should receive the file "some_html_submission.html"

Scenario: An Admin wants to download the file associated with a submission that doesn't have any files
	Given that sd@gmail.com is logged in with password cs169rocks
	Given I am on the "Introduction to HTML5" course page
	When I press "submit assignment"
	When I follow "Sign out"

	Given that aime@ngongang.com is logged in with password blabla
	Given I am on the students page
	When I follow "Sebastian Delgado"
	Then I should not see "Download submission"
