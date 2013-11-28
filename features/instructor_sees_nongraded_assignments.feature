Feature: An instructor sees all the assignments with grades pending
  As an Instructor
  so that I can see all the submissions that have not been graded yet

Background: Instructor can see all the assignments that have not been graded yet
  Given the following users exist:
	|id| first_name | last_name | email               | password   | password_confirmation |instruc|status|
	| 1| Sebastian  | Delgado   | sd@gmail.com        | cs169rocks | cs169rocks            |false  |approved|

	|2 | Ryan       | Wilson    | hotmale@hotmail.com | ilovebacon | ilovebacon            |false  |approved|
        |3 |Aime	| Ngongang  | aime@ngongang.com   | blabla     |blabla                 |true   |approved|


 Given the following courses exist:
        |id  | title                   |
        |1   |Intro to computer science|
        |2   |Intro to ruby            |
        |3   |Advanced Java            |

 Given the following submissions exist:
        |id | email              |title                    |
        |1  | hotmale@hotmail.com|Intro to computer science|
        |2  | hotmale@hotmail.com|Intro to ruby            |
        |3  | hotmale@hotmail.com|Advanced Java            |

Scenario: An instructor can see all submissions with pending grades
  Given I am logged in as "aime@ngongang.com" with password "blabla"
  Then I should see "Assignments to grade"
  When I follow "Assignments to grade"
  Then I should see 3 submissions	

