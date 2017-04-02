source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.2'
gem 'pg', '~> 0.19.0'
gem 'puma', '~> 3.0'
gem 'rack-cors', '~> 0.4.1'
gem 'graphql', '~> 1.5.5'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry-rails', '~> 0.3.5'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
