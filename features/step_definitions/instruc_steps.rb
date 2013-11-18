<<<<<<< Updated upstream
=======
Given /the following (.*?) exist:$/ do |type, table|
  table.hashes.each do |element|
    if type == "users" then User.create(element)
    elsif type =="submissions" then Submission.create(element)
    elsif type =="courses" then Course.create(element)
    end
  end
end
Given /^this instructor exist:$/ do 
    FactoryGirl.create(:instruc)
end
>>>>>>> Stashed changes
Given /I am logged in as "(.*?)" with password "(.*?)"$/ do |user, pass|
  
  visit '/signin'
  fill_in 'Email', :with => user
  fill_in 'Password', :with => pass
  click_button 'Sign in'
end

Given /I am on the "(.*?)" page$/ do |page|
  if page == "students"
    visit '/students'
  elsif page == "Ryan's submission"
    visit '/students/submission/2'
  end
end

<<<<<<< Updated upstream
Then (/^I should see (\d+) (.*?)$/) do |count,table|
  if table == "students" then
    assert User.where('instruc' => false).size == Integer(count)
  elsif table =="submissions" then
    assert Submission.where('user_id' =>2).size == Integer(count)
=======
Then (/^I should see  (\d+) (.*?)$/) do |count,table|
  if table == "students" then assert User.where('instruc' => false).size == Integer(count)
  elsif table =="submissions" then assert Submission.where('user_id' =>2).size == Integer(count)
>>>>>>> Stashed changes
  end
end

When(/^I fill "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  fill_in arg1, :with => arg2
end
