# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :list do
    name "Best list ever"
    

    factory :sys_list do
    	name "Beginner"
    	id 1
    	#this needs to create a word or else the test will never pass
    end
  end
end
