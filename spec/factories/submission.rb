FactoryGirl.define do
  factory :submission do
    grader_id   "1"
    grade  "B"
    feedback   "Could do better"
    user
    course
  end
end
