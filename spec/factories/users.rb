FactoryBot.define do
  factory :user do

    sequence :email do |n|
      "person#{n}@example.com"
    end
    password { "password" }

    factory :user_with_project do
      after(:create) do |user, evaluator|
        create_list(:project, 1, user: user)
      end
    end
  end
end
