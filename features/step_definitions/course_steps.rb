Given /the following courses exist/ do |courses_table|
    courses_table.hashes.each do |course|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that course to the database here.
    Course.create!(course)
  end
end
