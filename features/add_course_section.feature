Feature: Add a course with a subsection

	As a site instructor
	I want to be able to add a course with subsections
	So that students will be able to read better organized courses.

Background: There are courses in the databse and the user is logged in
  Given the following users exist:
	|id| first_name | last_name | email               | password   | password_confirmation |instruc|
	| 1| Sebastian  | Delgado   | sd@gmail.com        | cs169rocks | cs169rocks            |true   |

	Given the following courses exist:
	| title                       | tags  | content |
	| Introduction to HTML5       | web   |         |

  Given I am logged in as "sd@gmail.com" with password "cs169rocks"
  Given I am on the courses page

Scenario: Admins should be able to add sections to course texts using markdown
  Then I should see "Introduction to HTML5"
  When I follow "Introduction to HTML5"
  Then I should see "Edit Introduction to HTML5"
  When I follow "Edit Introduction to HTML5"
  When I fill in "content" with "First Level \n =========== \n Course Text"
  When I press "Update Course Info"
  Then I should see "First Level"
  Then I should see "Course Text"
  Then I should not see "==========="
  #Then I should see "Course Text" as a content title

Scenario: Admins fails to specify header
  Then I should see "Introduction to HTML5"
  When I follow "Introduction to HTML5"
  Then I should see "Edit Introduction to HTML5"
  When I follow "Edit Introduction to HTML5"
  When I fill in "content" with "First Level Course Text"
  When I press "Update Course Info"
  Then I should see "First Level"
  Then I should see "Course Text"
  #Then I should not see "Course Text" as a content title
