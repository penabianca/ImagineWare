Feature: Filter through courses and find a course

	As an aspiring developer with limited english
	I want help finding resources to learn HTML5
	so that I can build my revolutionary web app.

Background: There are courses on the database and the user is logged in

	Given the following courses exist:
	| title                       | tags                | content                                                        |
	| Introduction to HTML5       | web        | This is and HTML5 course. You must build a website from sratch |
	| Advanced Android            | a     | Here you will build a sick android app. Strap up!              |
	| Object Oriented Programming | b | Here you must build classes with inheretance in Java           |

	Given the following users exist:
	| first_name | last_name | email               | password   | password_confirmation |
	| Sebastian  | Delgado   | sd@gmail.com        | cs169rocks | cs169rocks            |
	| Ryan       | Wilson    | hotmale@hotmail.com | ilovebacon | ilovebacon            |
	
	#Given that sd@gmail.com is logged in
	
	Given I am on the courses page
	
Scenario: Filter course list and select a course.

  Then I should see "Introduction to HTML5"
  Then I should see "Advanced Android"
  Then I should see "Oriented Programming"
  Then I should see "web"
	When I follow "web"
  Then I should see "Introduction to HTML5"
  Then I should not see "Advanced Android"
  Then I should not see "Object Oriented Programming"
  When I follow "More about Introduction to HTML5"
  Then I should see "This is and HTML5 course. You must build a website from sratch"
