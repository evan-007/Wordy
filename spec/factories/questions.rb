# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    word "go"
    text "hey let's ___ to the park"
    answer ["go", "eat", "swim", "fly"]
    user
    quiz
  end
end
