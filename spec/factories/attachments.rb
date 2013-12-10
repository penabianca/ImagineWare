# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attachment do
    original_filename "Gemfile"
    content_type "text/plain"
    read "0101"
  end
end
