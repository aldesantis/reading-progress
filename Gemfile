source 'https://rubygems.org'
ruby '2.1.4'

# Rails
gem 'rails', '4.1.6'

# Preprocessors
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'

# Assets
gem 'jquery-rails'
gem 'turbolinks'
gem 'bootstrap-sass'

# Views
gem 'haml-rails'

# ActiveRecord
gem 'pg'

# JavaScript runtime
gem 'therubyracer', platform: :ruby

# Web server
gem 'thin'

# Process management
gem 'foreman'

# Configuration management
gem 'figaro'

group :development do
  # Preloading
  gem 'spring'
  gem 'spring-commands-rspec'

  # Guard
  gem 'guard-bundler'
  gem 'guard-rspec'

  # Filesystem events (for Guard)
  gem 'rb-fchange', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-inotify', require: false

  # Asset logs suppression
  gem 'quiet_assets'
end

group :development, :test do
  # Factories
  gem 'factory_girl_rails'
  gem 'faker'

  # Console
  gem 'pry-rails'

  # RSpec
  gem 'rspec-rails'
end

group :production do
  # Heroku
  gem 'rails_12factor'
end

group :test do
  # Acceptance testing
  gem 'capybara'
  gem 'launchy'
  gem 'poltergeist'

  # Database testing
  gem 'database_cleaner'
end
