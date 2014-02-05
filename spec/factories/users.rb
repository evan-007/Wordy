# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "duck"
    email "dd@ducks.com"
    password "duckling"
    password_confirmation "duckling"
    avatar { File.new("#{Rails.root}/spec/factories/avatar.png") }
    

    factory :invalid_user do
    	name nil
    end

    factory :quiz_user do
        association :quiz
    	association :question
    end
  end
end
