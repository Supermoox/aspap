source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

require 'net/http'


gem 'devise'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'jquery-rails'
gem 'paperclip', '~> 5.1'
gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.12'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'will_paginate', '>= 3.1'
gem "font-awesome-rails"
gem 'mailboxer'
gem 'activeadmin', '~> 1.0'
gem 'figaro'
gem 'aws-sdk', '~> 2.3'
gem 'fog'
gem 'gibbon', github: "amro/gibbon"
gem 'rails-social-share-button'
gem 'shareable'
gem 'acts_as_votable'
gem 'dotenv-rails'
gem 'ransack'
gem 'letter_opener',group: :development


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
