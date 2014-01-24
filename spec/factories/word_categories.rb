# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :word_category do
  	association :word
  	association :category
  end
end
