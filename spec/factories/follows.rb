# frozen_string_literal: true

FactoryBot.define do
  factory :follow do
    user
    association :follow, factory: :user
  end
end
