source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby


gem 'sqlite3'

#haml
gem 'haml'
gem 'bootstrap-sass', '~> 3.2.0.2'
gem 'font-awesome-sass', '~> 4.2.0'
gem 'faker'


# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. 
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc


gem 'activeadmin', github: 'activeadmin'
gem "devise"
# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

group :development, :test do
  gem 'puma'
  gem 'guard-rspec'
  gem 'libnotify'
  gem 'spork-rails'
  gem 'guard-spork'
  gem 'childprocess', '0.3.6'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'pry'
end

group :test do 
  
  gem 'selenium-webdriver', '~> 2.35.1'
  gem 'capybara', '>= 2.2.0'
  


end
group :production do
  # Use postgresql as the database for Active Record
  gem 'pg'
 
  gem 'rails_12factor'
end
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
