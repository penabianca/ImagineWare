Feature: Instructor can sign up to be able to tutor

  As an expert in Ruby on Rails 
  I want to create an account on ImagineWare
  So that I can give back my experience to others
  Background: Admin can log in and approve a request from an instrucor
Given the following users exist:
  | first_name | last_name | email               | password   | password_confirmation |instruc|admin|status|
  |admin       |man	   |admin@man.com	 |adminman    |adminman               |false  |true |approved|
  
  Scenario: Create an account for the first time
    Given I am on the home page
    When I follow "Instructors"
    When I fill in "user_first_name" with "Sebastian"
    When I fill in "user_last_name" with "Delgado"
    When I fill in "user_email" with "sd@gmail.com"
    When I fill in "user_password" with "goodbye"
    When I fill in "user_password_confirmation" with "goodbye"
    When I press "Create my account"
    Then I should see "Your request was sent to the administrator"

  Scenario: Create an account entering mismatched passwords
    Given I am on the home page
    When I follow "Instructors"
    When I fill in "user_first_name" with "Sebastian"
    When I fill in "user_last_name" with "Delgado"
    When I fill in "user_email" with "sd@gmail.com"
    When I fill in "user_password" with "goodbye"
    When I fill in "user_password_confirmation" with "g00dbye"
    When I press "Create my account"
    Then I should see "You did not enter all the fields correctly"

  Scenario: Admin signs in and accept instructor request
    Given I am on the home page
    When I follow "Instructors"
    When I fill in "user_first_name" with "Sebastian"
    When I fill in "user_last_name" with "Delgado"
    When I fill in "user_email" with "sd@gmail.com"
    When I fill in "user_password" with "goodbye"
    When I fill in "user_password_confirmation" with "goodbye"
    When I press "Create my account"
    Then I should see "Your request was sent to the administrator"
    Given I am logged in as "admin@man.com" with password "adminman"
    When I follow "Instructor requests"
    Then I should see "Sebastian Delgado"
    When I follow "accept"
    Then I should see "Thanks for approving Mr Sebastian Delgado as an instructor!"
    
   
