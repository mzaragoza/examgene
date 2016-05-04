source 'https://rubygems.org'

gem 'rails', '4.2.5.1'                     # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'

# Databases
gem 'pg'                                   # Use pg as the database for Active Record

# Payments
gem 'stripe'                                                                         # Payments

#Tools
gem 'awesome_print'                                                                  # Pretty print your Ruby objects with style
gem 'decent_exposure'                                                                # A helper for creating declarative interfaces in controllers
gem 'sass-rails', '~> 5.0'                                                           # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0'                                                           # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.1.0'                                                       # Use CoffeeScript for .coffee assets and views
# gem 'therubyracer', platforms: :ruby                                               # See https://github.com/rails/execjs#readme for more supported runtimes

gem 'simple_form'
gem "font-awesome-rails"                                                             # load font-awesome-rails
gem "haml-rails", "~> 0.9"                                                           # templating engine
gem 'friendly_id', '~> 5.1.0'                                                        # pretty URL’s and work with human-friendly strings
gem 'jbuilder', '~> 2.0'                                                             # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jquery-rails'                                                                   # Use jquery as the JavaScript library
gem 'turbolinks'                                                                     # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks (catching system)


# Images
gem 'carrierwave'
gem 'rmagick', require: false
gem 'fog'

# Security
gem 'devise'                              # authentication solution


group :development, :test do
  gem "better_errors"                     # Better error page for Rack apps
  gem "binding_of_caller"                 # Retrieve the binding of a method's caller
  gem "factory_girl_rails", "~> 4.0"      # A library for setting up Ruby objects as test data
  gem 'byebug'                            # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'letter_opener'                     # Preview mail in the browser instead of sending.
  gem 'spring'                            # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "ffaker"                                                                         # A library for generating fake data
  # RSpec
  # gem 'capistrano-rails'                # Use Capistrano for deployment
end

group :test do
  gem "spring-commands-rspec"             # For "spring"-loading rspec
  gem 'capybara'                          # Acceptance test framework for web applications
  gem 'database_cleaner'                  # Strategies for cleaning databases in Ruby
  gem 'rspec-collection_matchers'         # Collection cardinality matchers, extracted from rspec-expectations
  gem 'rspec-rails', '~> 3.0'             # RSpec for Rails-3
  gem 'rspec-retry'                       # retry randomly failing rspec example
  gem 'shoulda'                           # Collection of testing matchers
end

group :doc do
  gem 'sdoc', '~> 0.4.0'                                                             # bundle exec rake doc:rails generates the API under doc/api.
end

group :production do
  gem 'rails_12factor'                                                               # Makes running your Rails app easier
  # Exception Tracking
  # gem 'airbrake', '~> 5.1'                  # robust exception tracking
end


