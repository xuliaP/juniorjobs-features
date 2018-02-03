# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.0'

gem 'activerecord'
gem 'database_cleaner'
gem 'data_magic'
gem 'cucumber'
gem 'factory_bot'
gem 'faker', git: 'https://github.com/stympy/faker.git', branch: 'master'
gem 'page-object'
gem 'pg', '~> 0.18'
gem 'rspec'
gem 'selenium-webdriver'
gem 'sorcery'
gem 'watir'
