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

# haml
gem 'haml'
gem 'bootstrap-sass', '~> 3.2.0.2'
gem 'font-awesome-sass', '~> 4.2.0'
gem 'faker'
gem 'formtastic'
gem 'russian'
gem 'carrierwave', '0.8.0'
gem 'mini_magick'

# Paginate
gem 'kaminari'

# Ransack
gem 'ransack', github: 'activerecord-hackery/ransack'

# Gretel
gem "gretel"

# editor
gem 'redactor-rails', git: 'git@github.com:SammyLin/redactor-rails.git'

# Use jquery as the JavaScript library
gem 'jquery-rails'

gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'devise'
gem 'activeadmin', github: 'activeadmin'


gem 'rails_config'

group :development do
  gem 'better_errors'
  gem "binding_of_caller"
  gem 'annotate'
  gem 'spring'

  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano-rbenv'
end

group :development, :test do
  gem 'sqlite3'
  gem 'puma'
  gem 'guard-rspec'
  gem 'libnotify'
  gem 'spork-rails'
  gem 'guard-spork'
  gem 'childprocess', '0.3.6'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'pry-rails'

end

group :test do
  gem 'selenium-webdriver', '~> 2.35.1'
  gem 'capybara', '>= 2.2.0'
end
group :production do
  # Use postgresql as the database for Active Record
  gem 'mysql2'
  gem 'unicorn'
end
