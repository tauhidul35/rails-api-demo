source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Use Puma as the app server
gem 'puma', '~> 3.0'

gem 'active_model_serializers', '~> 0.10.2'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS),
# making cross-origin AJAX possible
# gem 'rack-cors'

# Use as html parser
gem 'nokogiri', '~> 1.6.8'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution
  # and get a debugger console
  gem 'byebug', platform: :mri

  # Use RSpec for specs
  gem 'rspec-rails', '~> 3.5.1'

  # Use Factory Girl for generating random test data
  gem 'factory_girl_rails', '~> 4.7.0'

  gem 'rubocop', '~> 0.42.0', require: false
  gem 'rubocop-rspec', '~> 1.6.0'

  gem 'rails-controller-testing', '~> 0.1.1'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Speeds up development by keeping your application running in background.
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
