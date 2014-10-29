FactoryGirl.define do
  factory :user do
    email "test@test.com"
    name "Cindy"
    password  "1234567890"
    password_confirmation "1234567890"
  end
end