Feature: Submit a file with my solutions for the course
	As an ImagineWare student
	I want to submit a file with my solutions to the course
	So that my code can be graded by the admins

Background: There are courses on the database and the user is logged in

	Given the following courses exist:
	| title                       | tags     | content                                                        |
	| Introduction to HTML5       | web      | This is and HTML5 course. You must build a website from sratch |
	| Advanced Android            | advanced | Here you will build a sick android app. Strap up!              |
	| Object Oriented Programming | beginner | Here you must build classes with inheretance in Java           |

	Given the following users exist:
	|id| first_name | last_name | email               | password   | password_confirmation |instruc|
	|1 | Sebastian  | Delgado   | sd@gmail.com        | cs169rocks | cs169rocks            |false  |
	|2 | Ryan       | Wilson    | hotmale@hotmail.com | ilovebacon | ilovebacon            |false  |
        |3 | Aime	| Ngongang  | aime@ngongang.com   | blabla     |blabla                 |true   |

Scenario: The user uploads a file and can download it from the grades page

	Given that sd@gmail.com is logged in with password cs169rocks
	Given I am on the "Introduction to HTML5" course page
	Then I should see "Choose file"
	Then I should see "Upload"
	When I attach an html file
	When I press "Upload"
	Then I should see "Your submission for Introduction to HTML5 was successful"
	Then I should be on the "Introduction to HTML5" course page
	When I follow "Grades"
	Then I should be on the my_grades page for "sd@gmail.com"
	Then I should see "Introduction to HTML5"
	Then I should see "Pending"
	Then I should see "Download submission"
	When I follow "Download submission"
	Then I should receive the file "some_html_submission.html"
	

Scenario: The user submits a file with the wrong extension (sad)
	Given that sd@gmail.com is logged in with password cs169rocks
	Given I am on the "Introduction to HTML5" course page
	Then I should see "Choose file"
	Then I should see "Upload"
	When I attach a ruby file
	Then I should see "You submitted the wrong file type"

Scenario: An Admin wants to download the file associated to a submission
	Given that sd@gmail.com is logged in with password cs169rocks
	Given I am on the "Introduction to HTML5" course page
	When I attach an html file
	When I press "Upload"
	When I follow "Sign out"

	Given that aime@ngongang.com is logged in with password blabla
	Given I am on the students page
	When I follow "Sebastian Delgado"
	Then I should see "Download submission"
	When I follow "Download submission"
	Then I should receive the file "some_html_submission.html"

	When I follow
