# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :name do |n|
      "my_quiz#{n}"
    end
  factory :quiz do
  	name 
  	kind 1
    user nil
    
    
    
    factory :no_quiz_callback do
      name 
      kind 1
      after(:build) { |quiz| quiz.class.skip_callback(:create, :after, :get_examples) }
    end
  end
end