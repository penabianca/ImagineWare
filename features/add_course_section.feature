Feature: Add a course with a subsection

	As a site administrator
	I want to be able to add a course with subsections
	So that students will be able to read better organized courses.

Background: There are courses in the databse and the user is logged in
	Given the following courses exist:
	| title                       | tags  | content                                                        |
	| Introduction to HTML5       | web   | This is and HTML5 course. You must build a website from sratch |

  #Given that an administrator is logged in
  Given I am on the courses page

Scenario: Markup should be displayed properly on courses
    Then I should see "ImagineWare"

Scenario: Admins should be able to add sections to course texts using markup
    Then I should see "ImagineWare"

Scenario: Admins should not be able create improperly formatted courses
    Then I should see "ImagineWare"
