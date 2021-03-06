source "https://rubygems.org"

ruby "2.6.5"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

############################################################################
# explicit dependecies for independent updating
############################################################################
gem "nokogiri"

############################################################################
# Rails (what rails new gave us)
############################################################################

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 6.0"
# Use postgresql as the database for Active Record
gem "pg"
# Use Puma as the app server
gem "puma"

# Use Redis adapter to run Action Cable in production
gem "redis"
# Use ActiveModel has_secure_password
gem "bcrypt"

# See https://github.com/rails/execjs#readme for more supported runtimes
gem "therubyracer", platforms: :ruby

############################################################################
# Javascript
############################################################################

# Use jquery as the JavaScript library
gem "jquery-rails"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.5"
gem "webpacker"

############################################################################
# Views
############################################################################
gem "slim", require: "slim/smart"
gem "slim-rails"
# Markdown
gem "redcarpet"
# Stacic Pages
gem "high_voltage"
# Avatars
gem "gravatar_image_tag"

############################################################################
# Deployment
############################################################################
gem "figaro"
gem "bootsnap", ">= 1.1.0", require: false

############################################################################
# Debugging
############################################################################
gem "awesome_print", github: "awesome-print/awesome_print"

############################################################################
# Development Tools
############################################################################

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "web-console", ">= 3.3"
  # better errors gives a console & clickable stacktraces in the browser
  gem "better_errors", github: "lastobelus/better_errors", branch: "sp-fulfillment"
  gem "binding_of_caller"

  gem "listen", "~> 3"

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"

  # Views & Generators
  gem "html2slim"
  gem "foreman"

  # memory profiling & benchmarks
  gem "memory_profiler"
  gem "derailed_benchmarks"

  # Linting
  gem "rubocop"

  # adds backtrace to queries
  gem "active_record_query_trace"

  # ERD diagrams
  gem "rails-erd"

  # for chrome extension
  gem "meta_request"
end

############################################################################
# Test Tools
############################################################################
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platform: :mri
  gem "rspec-rails", "~> 3"
  gem "guard-rspec", require: false
  gem "ruby-prof", ">= 0.17.0", require: false
  gem "stackprof"
  gem "test-prof"
  gem "capybara", ">= 2.15"
  gem "cypress-on-rails"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "webdrivers", "~> 3.0"
  gem "rspec-html-matchers"

  gem "vcr"
  gem "webmock"
  gem "timecop"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
