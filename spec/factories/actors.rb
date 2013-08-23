# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :actor do
    firstname "brad"
    lastname "pitt"
    
        
    factory :actor_of_many_movies, class: Actor do   
     
      ignore do actings_count 1 end
      after(:create) do |actor, evaluator|
        FactoryGirl.create_list(:acting, evaluator.actings_count, actor: actor)
      end
    end
    
    factory :actor_of_two_movies, class: Actor do   
     
      ignore do actings_count 2 end
      after(:create) do |actor, evaluator|
        FactoryGirl.create_list(:acting, evaluator.actings_count, actor: actor)
      end
    end      
  end
end
