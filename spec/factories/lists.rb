# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :list do
    name "Best list ever"
    user nil
    id 4

    factory :sys_list do
    	name "Beginner"
    	id 1
    end
  end
end
