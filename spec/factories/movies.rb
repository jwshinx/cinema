# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :movie do
    title "godfather"
    description "blah"
    year 1970
    gross 300
    category_id 1
  end
end
