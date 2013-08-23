# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :acting do
    #actor_id 1
    #movie_id 1
    association :actor, factory: :actor
    association :movie, factory: :movie    
    payment 1
  end
end
