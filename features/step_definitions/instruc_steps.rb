Given /the following (.*?) exist:$/ do |type, table|
  table.hashes.each do |element|
    if type == "users" then User.create(element)
    elsif type =="submissions" then Submission.create(element)
    elsif type =="courses" then Course.create(element)
    end
  end
end

Given /I am logged in as "(.*?)" with password "(.*?)"$/ do |user, pass|
  
  visit '/signin'
  fill_in 'Email', :with => user
  fill_in 'Password', :with => pass
  click_button 'Sign in'
end

Given /I am on the "(.*?)" page$/ do |page|
  if page == "students"
    visit '/students'
  end
end

Then (/^I should see  (\d+) (.*?)$/) do |count,table|
  if table == "students" then
    assert User.where('instruc' => false).size == Integer(count)
  elsif table =="submissions" then
    assert Submission.where('user_id' =>2).size == Integer(count)
  end
end
