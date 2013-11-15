FactoryGirl.define do
  factory :user do
    first_name  "Aime"
    last_name   "Ngongang"
    email    "aime@ngongang.com"
    password "penabianca"
    password_confirmation "penabianca"
    trait :admin do
      admin true
    end
    trait :instruc do
      instruc true
    end
    factory :admin, traits: [:admin]
    factory :instructor, traits: [:instruc]
  end
end

