FactoryGirl.define do
  factory :user do
    first_name  "Aime"
    last_name   "Ngongang"
    email    "aime@ngongang.com"
    password "penabianca"
    password_confirmation "penabianca"
 
    factory :admin do
      admin true
    end
  end
end
