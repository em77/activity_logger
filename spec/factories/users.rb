FactoryGirl.define do
  factory :user do
    first_name "Joe"
    last_name "User"
    email "test@example.com"
    password "password"

    trait :admin do
      role "admin"
    end
  end

  factory :admin, class: User do
    first_name "Joe"
    last_name "Admin"
    email "admin@example.com"
    password "password"
    role "admin"
  end
end
