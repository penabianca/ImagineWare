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
	|id| first_name | last_name | email               | password   | password_confirmation |instruc|
	|1 | Sebastian  | Delgado   | sd@gmail.com        | cs169rocks | cs169rocks            |false  |
	|2 | Ryan       | Wilson    | hotmale@hotmail.com | ilovebacon | ilovebacon            |false  |
        |3 | Aime	| Ngongang  | aime@ngongang.com   | blabla     |blabla                 |true   |
	


Scenario: make a submission and get feedback

	Given that sd@gmail.com is logged in with password cs169rocks
	Given I am on the courses page
        Then I should see "Introduction to HTML5"
        When I follow "Introduction to HTML5"
	Then I should be on the "Introduction to HTML5" course page
	When I press "submit assignment"
	Then I should see "Your submission for Introduction to HTML5 was successful"
	Then I should be on the "Introduction to HTML5" course page
	When I follow "Grades"
	Then I should be on the my_grades page for "sd@gmail.com"
	Then I should see "Introduction to HTML5"
	Then I should see "Pending"
	
	When I follow "Sign out"
	Given that aime@ngongang.com is logged in with password blabla

	Given I am on Sebastian's submission page
	Then I should see "Introduction to HTML5"
	When I follow "Introduction to HTML5"
	Then I should see "grade assignment"
	When I follow "grade assignment"
	When I fill "Grade" with "B"
	When I fill "Feedback" with "Awesome stuff!"
	Then I press "Submit grade"
	Then I should see "Sebastian's submission for Introduction to HTML5 has been graded"
	
	When I follow "Sign out"
	Given that sd@gmail.com is logged in with password cs169rocks

	When I follow "Grades"
	Then I should be on the my_grades page for "sd@gmail.com"
	Then I should see "Introduction to HTML5"
	Then I should see "B"

Scenario: admin cannot submit in the course view (sad path)

	Given that aime@ngongang.com is logged in with password blabla
	Given I am on the courses page
	Then I should see "Introduction to HTML5"
	When I follow "Introduction to HTML5"
	Then I should not see "submit assignment"

