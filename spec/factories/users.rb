FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@email.com" }
    sequence(:name) { |n| "user_#{n}" }
    sequence(:user_name) { |n| "user_#{n}" }

    password { '123123123' }

    avatar { Helpers::FileSpecHelper.avatar }
    banner { Helpers::FileSpecHelper.banner }
  end
end
