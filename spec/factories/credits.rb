# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :credit, :class => 'Credits' do
    user_id ""
    credit 1
  end
end
