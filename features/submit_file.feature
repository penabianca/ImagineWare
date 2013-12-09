Feature: Submit a file with my solutions for the course
	As an ImagineWare student
	I want to submit a file with my solutions to the course
	So that my code can be graded by the admins

Background: There are courses on the database and the user is logged in

	Given the following courses exist:
	| title                       | content                                                        |
	| Introduction to HTML5       | This is and HTML5 course. You must build a website from sratch |
	| Advanced Android            | Here you will build a sick android app. Strap up!              |
	| Object Oriented Programming | Here you must build classes with inheretance in Java           |

	Given the following users exist:
	|id| first_name | last_name | email               | password   | password_confirmation |instruc|admin| status   |
	|1 | Sebastian  | Delgado   | sd@gmail.com        | cs169rocks | cs169rocks            |false  |false| approved |
	|2 | Ryan       | Wilson    | hotmale@hotmail.com | ilovebacon | ilovebacon            |false  |false| approved |
        |3 | Aime	| Ngongang  | aime@ngongang.com   | blabla     | blabla                |true   |false| approved |

Scenario: The user uploads a file and can download it from the grades page
	
	Given that sd@gmail.com is logged in with password cs169rocks
	Given I am on the courses page
	When I follow "Introduction to HTML5"
	When I attach an html file
	When I press "Upload"
	Then I should see "Your file was successfully attached please press on submit assignment"
	When I press "submit assignment"
	Then I should see "Your submission for Introduction to HTML5 was successful"
	Then I should see "Introduction to HTML5"
	Then I should see "Pending"
	When I follow "Download Assignment"
	Then I should receive the file "some_html_submission.html"
	

Scenario: The user submits a file with the wrong extension (sad)
	Given that sd@gmail.com is logged in with password cs169rocks
	Given I am on the "Introduction to HTML5" course page
	When I attach a ruby file
	When I press "Upload"
	When I press "submit assignment"
	When I follow "Download Assignment"
	Then I should receive the file "some_ruby_submission.rb"

