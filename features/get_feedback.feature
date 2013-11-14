Feature: View grade for submitted course

  As a computer science student
  I want to get feedback on the Kinect SDK course I took online
  So that I can see what I need to improve to make my first Kinect game.

Background:

	Given the following courses exist:
	| title                       | tags                | content                                                        |
	| Introduction to HTML5       | beginner,web        | This is and HTML5 course. You must build a website from sratch |
	| Advanced Android            | advanced,mobile     | Here you will build a sick android app. Strap up!              |
	| Object Oriented Programming | intermediate,coding | Here you must build classes with inheretance in Java           |

	Given the following users exist:
	| first_name | last_name | email               | password   |
	| Sebastian  | Delgado   | sd@gmail.com        | cs169rocks |
	| Ryan       | Wilson    | hotmale@hotmail.com | ilovebacon |
	
	Given that sd@gmail.com is logged in with password cs169rocks
	Given I am on the courses page
        Then I should see "Introduction to HTML5"
        When I follow "Introduction to HTML5"
	Then I should be on the "Introduction to HTML5" page

Scenario: Upload file and get feedback

	When I submit my assignment file "submission_one.html"
	Then I should see "Your submission for Introduction to HTML5 was successful" message
	Then I should be on the "Introduction to HTML5" page
	When I follow "courses"
	Then I should be on the "Courses" page
	Then I should see the following submission: "Introduction to HTML5", "Pending"
	Given that my "Introduction to HTML5" submission gets graded with a "B"
	When I follow "courses"
	Then I should see the following submission: "Introduction to HTML5", "B"

Scenario: Incorrect file extension error

	When I submit my assignment file "submission_two.txt"
	Then I should see "You submitted a file with the wrong file extension, please re-submit a file that ends in '.html'"
	When I follow "profile"
	Then I should not see the following submission: "Introduction to HTML5", "B"
