Given /the following courses exist/ do |courses_table|
  courses_table.hashes.each do |course|
      @course         = Course.new
      @course.title   = course['title']
      @course.content = course['content']
      @course.tag_list.add(course['tags'])

      @course.save
  end
end

When /^(?:|I )fill in "([^"]*)" with Markdown body/ do |field, value|
  fill_in(field, :with => value)
end

When /^I filter by the following tags: (.*)/ do |tag_list|
    pending # express the regexp above with the code you wish you had
end

Then /^I should see "([^"]*)" in the selector "([^"]*)"$/ do |text, selector|
  page.should have_selector selector, text: text
end

Then /^I should not see "([^"]*)" in the selector "([^"]*)"$/ do |text, selector|
  page.should_not have_selector selector, text: text
end
