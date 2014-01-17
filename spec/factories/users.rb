# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "duck"
    email "dd@ducks.com"
    password "duckling"
    password_confirmation "duckling"
    password_digest "MyString"

    factory :invalid_user do
    	name nil
    end
  end
end
