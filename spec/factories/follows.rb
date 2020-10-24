FactoryBot.define do
  factory :follow do
    user
    association :follow, factory: :user
  end
end
