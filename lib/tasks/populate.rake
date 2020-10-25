# frozen_string_literal: true

namespace :db do
  desc 'Erase and Fill database'
  task populate: :environment do
    [
      Follow,
      Postage,
      User
    ].each(&:delete_all)

    100.times do
      name = Faker::FunnyName.name
      User.create_with(
        name: name,
        password: '123123123'
      ).find_or_create_by!(
        email: Faker::Internet.unique.email,
        user_name: Faker::Internet.unique.username(specifier: name, separators: %w[. _ -])
      )
    end

    100.times do
      Follow.create(
        user: User.all.sample,
        follow: User.all.sample
      )
    end

    User.all.each do |user|
      10.times do
        Postage.create(
          user: user,
          content: Faker::Lorem.paragraphs(number: 1)
        )
      end
    end
  end
end
