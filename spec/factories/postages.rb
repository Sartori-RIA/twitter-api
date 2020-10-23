FactoryBot.define do
  factory :postage do
    content { "MyString" }
    picture { Helpers::FileSpecHelper.image }
    user
  end
end
