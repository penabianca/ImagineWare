Given /the following courses exist/ do |courses_table|
  courses_table.hashes.each do |course|
      @course         = Course.new
      @course.title   = course['title']
      @course.tag_list.add(course['tags'])
      @course.content = course['content']

      @course.save!
  end
end

When /^I filter by the following tags: (.*)/ do |tag_list|
    pending # express the regexp above with the code you wish you had
end

