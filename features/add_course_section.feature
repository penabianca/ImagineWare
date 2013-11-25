Feature: Add a course with a subsection

	As a site instructor
	I want to be able to add a course with subsections
	So that students will be able to read better organized courses.

Background: There are courses in the databse and the user is logged in
  Given the following users exist:
    |id| first_name | last_name | email               | password   | password_confirmation |instruc|status|
    | 1| Sebastian  | Delgado   | sd@gmail.com        | cs169rocks | cs169rocks            |true   |approved|

	Given the following courses exist:
	| title                       | tags  | content |
	| Introduction to HTML5       | web   |         |

  Given I am logged in as "sd@gmail.com" with password "cs169rocks"
  Given I am on the courses page

Scenario: Admins should be able to add sections to course texts using markdown
  Then I should see "Add new Course"
  When I follow "Add new Course"
  When I fill in "course_title" with "Kinect Mastery"
  When I fill in "course_content" with Markdown body
    """
    First Level
    ===========
    Course Text
    """
  When I press "Create course"
  Then I should see "Kinect Mastery"
  When I follow "Kinect Mastery"
  Then I should see "First Level" in the selector "h1"
  Then I should see "Course Text"
  Then I should not see "==========="

Scenario: Admins fails to specify header
  Then I should see "Add new Course"
  When I follow "Add new Course"
  When I fill in "course_title" with "Kinect Mastery"
  When I fill in "course_content" with Markdown body
    """
    First Level
    Course Text
    """
  When I press "Create course"
  Then I should see "Kinect Mastery"
  When I follow "Kinect Mastery"
  Then I should not see "First Level" in the selector "h1"
  Then I should see "Course Text"
