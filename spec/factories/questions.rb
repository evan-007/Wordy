# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    word "MyString"
    text "MyText"
    answer ""
  end
end
