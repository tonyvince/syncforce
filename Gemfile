source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
# Easy and secure configuration
gem 'figaro', '>= 1.2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Salesforce ruby client
gem 'restforce', '~> 5.0.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
# Linting using rubocop
gem 'rubocop-rails', '>= 2.0.0', require: false
gem 'sass-rails', '~> 6.0.0'
gem 'sprockets-rails', '>= 2.0.0', require: 'sprockets/railtie'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'

group :development, :test do
  # Adds step-by-step debugging and stack navigation capabilities to pry using byebug.
  gem 'pry-byebug', '~> 3.9.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  # Use factory bot for fixtures
  gem 'factory_bot_rails', '~> 6.1.0'
  gem 'selenium-webdriver', '~> 3.142.7'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers', '~> 4.4.1'
end

group :development do
  gem 'listen', '~> 3.2'
  # rspec for testing
  gem 'rspec-rails', '~> 4.0.1'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.1.0'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
