source 'http://rubygems.org'

gem 'rails', '3.1.3'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'execjs'
gem 'therubyracer'

gem 'sqlite3'
gem 'devise'
gem 'carrierwave'
gem "rmagick"
gem 'acts-as-taggable-on', '~>2.2.0'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
group :test, :development do
  gem 'rspec-rails'
# gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'pry'
  gem 'pry-doc'
end

group :test do
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'valid_attribute'
  gem "shoulda-matchers"

  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-rspec'

  # Pretty printed test output
  gem 'turn', '0.8.2', :require => false
  gem 'rspec'
end

