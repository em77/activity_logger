FactoryGirl.define do
  factory :user do
    email "test@example.com"
    password "password"

    trait :admin do
      role "admin"
    end
  end

  factory :admin, class: User do
    email "admin@example.com"
    password "password"
    role "admin"
  end
end
