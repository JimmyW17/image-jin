source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.5.3"

gem "autoprefixer-rails"
gem "honeybadger"
gem "jquery-rails"
gem "pg"
gem "puma"
gem "rack-canonical-host"
gem "rails", "~> 5.2.0"
gem "recipient_interceptor"
gem "sass-rails", "~> 5.0"
gem "skylight"
gem "sprockets", ">= 3.0.0"
gem "title"
gem "uglifier"
gem "bootsnap", require: false


group :development do
  gem "listen"
  gem "rack-mini-profiler", require: false
  gem "spring"
  gem "web-console"
  gem 'guard-rspec'
  gem 'rspec-rails'
end

group :development, :test do
  gem "awesome_print"
  gem "bundler-audit", ">= 0.5.0", require: false
  gem "dotenv-rails"
  gem "pry-byebug"
  gem "pry-rails"
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'capybara'
  gem 'faker'
  gem 'selenium-webdriver'
end

group :test do
  gem "formulaic"
  gem "launchy"
  gem "simplecov", require: false
  gem "timecop"
  gem "webmock"
end

gem "suspenders", group: [:development, :test]
gem 'devise'
gem 'bootstrap'
gem 'material_icons'
gem 'font-awesome-rails'
gem 'dropzonejs-rails'
gem 'react-rails'
gem 'google-cloud-vision'