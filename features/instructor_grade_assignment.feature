Feature: Instructor can grade an submission
  As an instructor
  so that I can change a student's grade
Background: users , courses and submissions have been added to the database
 Given the following users exist:
	|id| first_name | last_name | email               | password   | password_confirmation |instruc|
	| 1| Sebastian  | Delgado   | sd@gmail.com        | cs169rocks | cs169rocks            |false  |
<<<<<<< Updated upstream
	|2 | Ryan       | Wilson    | hotmale@hotmail.com | ilovebacon | ilovebacon            |false  |
  |3 |Aime	      | Ngongang  | aime@ngongang.com   | blabla     |blabla                 |true   |
=======
	|2 | Ryan       | Wilson    | hotmale@hotmail.com | ilovebacon | ilovebacon            |false  | 
        |3 |Aime	| Ngongang  | aime@ngongang.com   | blabla     |blabla                 |false  |
>>>>>>> Stashed changes

Given the following courses exist:
  |id  | title                   |
  |1   |Intro to computer science|
  |2   |Intro to ruby            |
  |3   |Advanced Java            |

Given the following submissions exist:
  |id | email              |title                    |
  |1  | hotmale@hotmail.com|Intro to computer science|
  |2  | sd@gmail.com       |Intro to ruby            |
  |3  | hotmale@hotmail.com|Advanced Java            |

Scenario: An instructor can see all students
<<<<<<< Updated upstream
  Given I am logged in as "aime@ngongang.com" with password "blabla"
  Then I should see "All Students"
  When I follow "All Students"
  Then I should see 2 students
=======
  Given this instructor exist:
  Then I should see "All students"
  When I follow "All students"
  Then I should see  2 students 
>>>>>>> Stashed changes

Scenario: A non instructor cannot see all students
  Given I am logged in as "sd@gmail.com" with password "cs169rocks"
  Then I should not see "All Students"

Scenario: An instructor can see all the student's submission
  Given I am on the students page
  When I follow "Ryan Wilson" 
<<<<<<< Updated upstream
  Then I should see 2 submissions

Scenario: An instructor can grade an assignment
  Given I am logged in as "aime@ngongang.com" with password "blabla"
  Given I am on Ryan's submission page
  Then I should see "Intro to computer science"
  When I follow "Intro to computer science"
  Then I should see "grade assignment"
  When I follow "grade assignment"
  When I fill "Grade" with "B"
  When I fill "Feedback" with "good job"
  Then I press "Submit grade"
  Then I should see "Ryan's submission for Intro to computer science has been graded"
=======
  Then I should see  2 submissions 
>>>>>>> Stashed changes
