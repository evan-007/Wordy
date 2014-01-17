# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :word do
    name "cats"
    definition "so fluffy"
    pos "nouns"
    ipa "/k/ /at/ /s/"
  end
end
