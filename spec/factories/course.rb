FactoryGirl.define do
  factory :course do
    id 1
    title "Introduction to HTML5"
    content "Javascript without the javascript"
    tag_list ['beginner', 'web']
  end
end
