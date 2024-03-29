source 'https://rubygems.org'

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.4'

gem 'bootstrap-sass'

gem 'bootstrap_form'
gem 'bootstrap_form_extensions'

# Use postgresql as the database for Active Record
gem 'pg', '~> 0.21'
# For searching
gem 'pg_search'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.6'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# Date and time picker
gem 'flatpickr'
# Pagination
gem 'will_paginate'
# will_paginate integration with bootstrap
gem 'will_paginate-bootstrap'
# For next/previous record
gem 'order_query'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Puma as the app server
gem 'puma'

# For authentication
gem 'sorcery'

# For authorization
gem 'pundit'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'shoulda-matchers'
  # Fake data generator for testing
  gem 'faker'
  gem 'database_cleaner'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  gem 'rack-timeout'
end
