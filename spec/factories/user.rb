FactoryGirl.define do
  factory :user do
    name "John"
    email  "john@example.com"
    password "password"
  end

  factory :admin, class: User do
    name "Administrator"
    email  "admin@example.com"
    password "password"
    role 1
  end
end
