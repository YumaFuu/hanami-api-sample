# frozen_string_literal: true

source "https://rubygems.org"

ruby "2.7.1"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem "hanami-api", "0.1.0"
gem "rake"
gem "rom"
gem "rom-sql"
gem "mysql2"

gem "dry-struct"
gem "dry-types"
gem "dry-container"
gem "dry-auto_inject"
gem "dry-validation", "~> 1.0"

gem "jwt"

group :development do
  gem 'shotgun', platforms: :ruby
end

group :test, :development do
  gem 'dotenv', '~> 2.4'

  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-doc'

  gem 'rubocop'
  gem 'rubocop-rspec'
end

group :test do
  gem 'capybara'
  gem 'rspec'
end

group :production do
  # gem 'puma'
end
