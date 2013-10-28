Background: There are courses on the database and the user is logged in

	Given the following courses exist:
	| title                       | tags                | content                                                        |
	| Introduction to HTML5       | beginner,web        | This is and HTML5 course. You must build a website from sratch |
	| Advanced Android            | advanced,mobile     | Here you will build a sick android app. Strap up!              |
	| Object Oriented Programming | intermediate,coding | Here you must build classes with inheretance in Java           |

	Given the following users exist:
	| first_name | last_name | email               | password   |
	| Sebastian  | Delgado   | sd@gmail.com        | cs169rocks |
	| Ryan       | Wilson    | hotmale@hotmail.com | ilovebacon |
	
	Given that sd@gmail.com is logged in
	
	Given that I am on the "Browse Courses" page

Scenario: Filter course list and select a course.
	
	When I filter by the following tags: beginner, web
	When I press "refresh"
	Then I should see the following courses: "Introduction to HTML5"
	When I press "Introduction to HTML5"
	Then I should be on the "Introduction to HTML5" page

Scenario: Cannot find a course with tags
	When I filter by the following tags: intermediate, web
	When I press "refresh"
	Then I should see "No courses found" message
	Then I should not see any courses