source 'https://rubygems.org'

ruby '2.4.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end



############################################################################
# Rails (what rails new gave us)
############################################################################

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.2'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]



############################################################################
# Views
############################################################################
gem 'slim', require: 'slim/smart'
gem "slim-rails"
# Markdown
gem 'redcarpet'



############################################################################
# Authentication & Authorization
############################################################################
gem 'devise'
gem 'omniauth'
gem 'omniauth-github'
gem 'omniauth-google'


############################################################################
# Javascript
############################################################################

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# the new Rails 5.1 integrated webpack support
gem 'webpacker', git: 'https://github.com/rails/webpacker.git'



############################################################################
# Deployment
############################################################################
gem 'figaro'



############################################################################
# Development Tools
############################################################################

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3'
  # better errors gives a console & clickable stacktraces in the browser
  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'listen', '~> 3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Views & Generators
  gem 'html2slim'
  gem 'foreman'
end



############################################################################
# Test Tools
############################################################################
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3'
end