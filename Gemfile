# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'api-pagination'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'cancancan'
gem 'carrierwave', '~> 2.0'
gem 'carrierwave-i18n'
gem 'devise'
gem 'devise-argon2'
gem 'devise-encryptable'
gem 'devise-i18n'
gem 'devise-jwt', '~> 0.7.0'
gem 'dry-configurable', '0.9.0'
gem 'fog-aws'
gem 'kaminari'
gem 'mini_magick'
gem 'paranoia', '~> 2.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'pg_search'
gem 'puma', '~> 4.1'
gem 'rack-attack'
gem 'rack-cors'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'rails-i18n'
gem 'rubocop-rails'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'fuubar'
  gem 'rspec'
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'mailcatcher'
  gem 'rubocop', require: false
  gem 'rubocop-rspec'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
