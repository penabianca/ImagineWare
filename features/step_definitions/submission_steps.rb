Given /the following submissions exist/ do |submissions_table|
    submissions_table.hashes.each do |submission|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that course to the database here.
      @sub             = Submission.new
      @sub.id          = submission['id']
      @sub.user_id     = User.find_by_email(submission['email']).id
      @sub.save
    end
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

Given(/^that my "(.*?)" submission gets graded with a "(.*?)"$/) do |arg1, arg2|
    pending # express the regexp above with the code you wish you had
end

When(/^I press on "(.*?)"$/) do |arg1|
    pending # express the regexp above with the code you wish you had
end
