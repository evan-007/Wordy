# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :word do
    name "cats"
    definition "so fluffy"
    pos "nouns"
    ipa "/k/ /at/ /s/"

    factory :many_words do
    	sequence :name do |n|
    	"asdf#{n}"
    	end
	end 
  end
end
