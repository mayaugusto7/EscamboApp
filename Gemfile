source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.8'
gem 'rails-i18n'

# Manage Procfile-based applications http://ddollar.github.com/foreman
gem 'foreman'
# Flexible authentication solution for Rails with Warden. http://blog.plataformatec.com.br/tag/…
gem 'devise'
gem 'devise-i18n'
# Rails gem of the Bootstrap based admin theme SB Admin 2. http://dreamingechoes.github.io/boots…
gem 'bootstrap_sb_admin_base_v2'
#  Font-awesome font bundled as an asset for the rails asset pipeline http://fortawesome.github.com/Font-Aw…
gem 'font-awesome-rails'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Generate Entity-Relationship Diagrams for Rails applications http://voormedia.github.io/rails-erd
  gem 'rails-erd'

  # Faker JS
  gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'

  #Markdown Lorem Ipsum generator https://github.com/geekjuice/doctor_ipsum
  gem 'doctor_ipsum'

  # Catches mail and serves it through a dream. http://mailcatcher.me
  gem 'mailcatcher'

  # Ruby Mine Debug  remote
  gem 'ruby-debug-ide', '~> 0.6.0'
  gem 'debase'

  # Lero Lero Generator
  gem 'lerolero_generator'

  # Capistrano Deploy automatizado
  gem 'capistrano', '~> 3.7'
  gem 'capistrano-bundler', '~> 1.2'
  gem 'capistrano-rails', '~> 1.2'
  gem 'capistrano-rvm'
end

group :development do
  gem 'guard'
  gem 'guard-livereload', '~> 2.5', require: false
end

source 'https://rails-assets.org' do
  # Bootstrap 3.3.7
  gem 'rails-assets-bootstrap', '3.3.7'

  # BootBox JS
  gem 'rails-assets-bootbox'

  # NotifyJS
  # gem 'rails-assets-notifyjs'

  # BootstrapNotify
  gem 'rails-assets-bootstrap.growl'

  # Animate CSS
  gem 'rails-assets-animate-css'

  # Bootstrap Markdown
  gem 'rails-assets-bootstrap-markdown'

  # Marked
  gem 'rails-assets-marked'

  # History JS
  gem 'rails-assets-history.js'

end

#Help ActiveRecord::Enum feature to work fine with I18n and simple_form.
gem 'enum_help'

# Minimal authorization through OO design and pure Ruby classes
gem 'pundit'

# Integration of RubyMoney - Money with Rails
gem 'money-rails', '~>1.12'

# Easy file attachment management for ActiveRecord thoughtbot.com/open-source
gem 'paperclip', '~> 6.0.0'

# jQuery UI for the Rails asset pipeline https://github.com/jquery-ui-rails/jquery-ui-rails
gem 'jquery-ui-rails'

#The safe Markdown parser, reloaded.
gem 'redcarpet'

# http://norman.github.io/friendly_id
gem 'friendly_id', '~> 5.2.0'

# https://github.com/igor-alexandrov/wiselinks
gem 'wiselinks'

# A Scope & Engine based, clean, powerful, customizable and sophisticated paginator for Ruby webapps
# https://github.com/amatsuda/kaminari/…
gem 'kaminari'

# https://github.com/tigrish/kaminari-i18n
gem 'kaminari-i18n'

# ⭐️ A Ruby Gem that wraps the functionality of jQuery Raty library, and provides optional IMDB style rating.
# http://ratingmoviestore.herokuapp.com
gem 'ratyrate'

group :production do
  gem 'mysql2'
end