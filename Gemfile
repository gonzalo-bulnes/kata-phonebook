source 'https://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Gems used only for development and test
# Insulating 'sqlite3' from :production is required
# to allow deployment to Heroku
group :development, :test do
  gem 'rspec-rails'
  gem 'sqlite3'
end

group :test do
  gem 'capybara'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'guard-cucumber'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'spork'

  # Notifications gems to be used with Guard
  # See http://ruby.railstutorial.org/chapters/static-pages#sec-guard

  # Notifications gems on Linux
  gem 'rb-inotify', '0.8.8'
  gem 'libnotify', '0.5.9' 

  # Notifications gems on Macintosh OS X
  #gem 'rb-fsevent', '0.9.1', :require => false
  #gem 'growl', '1.0.3' 

  # Notifications gems on Windows
  #gem 'rb-fchange', '0.0.5'
  #gem 'rb-notifu', '0.0.4'
  #gem 'win32console', '1.3.0'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem 'carrierwave'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
