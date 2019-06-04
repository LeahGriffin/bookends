FactoryBot.define do
  factory :comment do
    
  end

  factory :user do
    sequence :email do |n|
       "dummyEmail#{n}@gmail.com" 
    end
    password { "secretPassword" }
    password_confirmation { "secretPassword" }
  end

    factory :medium do
    title { "book" }
    association :user
  end
end
