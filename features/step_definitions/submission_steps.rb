Given /the following submissions exist/ do |submissions_table|
    submissions_table.hashes.each do |submission|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that course to the database here.
    #Submission.create(submission)
      @sub             = Submission.new
      @sub.id          = submission['id']
      @sub.user_id     = User.find_by_email(submission['email']).id
      @sub.course_id   = Course.find_by_title(submission['title']).id
      @sub.save
    end
end

When /^I attach an html file$/ do 
    attach_file('attachment', File.join(Rails.root, 'features', 'uploads', 'some_html_submission.html'))
end

When /^I attach a ruby file$/ do 
    attach_file('attachment', File.join(Rails.root, 'features', 'uploads', 'some_ruby_submission.rb'))
end

Then /^I should receive the file "(.*)"$/ do |file|
    #correct_content_type = (page.response_headers['Content-Type'].should == "text/html") or (page.response_headers['Content-Type'].should == "application/x-ruby")
    correct_content_disposition = page.response_headers['Content-Disposition'].should =~ /#{file}/
    assert correct_content_disposition #correct_content_type and
end

When(/^I submit my assignment$/) do
    pending # express the regexp above with the code you wish you had
end

Then(/^I should see "(.*?)" message$/) do |arg1|
    pending # express the regexp above with the code you wish you had
end

Then(/^I should see the following submission: "(.*?)", "(.*?)"$/) do |arg1, arg2|
    pending # express the regexp above with the code you wish you had
end

Then(/^I should not see the following submission: "(.*?)", "(.*?)"$/) do |arg1, arg2|
    pending # express the regexp above with the code you wish you had
end

Given(/^that my "(.*?)" submission gets graded with a "(.*?)"$/) do |arg1, arg2|
    pending # express the regexp above with the code you wish you had
end

When(/^I press on "(.*?)"$/) do |arg1|
    pending # express the regexp above with the code you wish you had
end
