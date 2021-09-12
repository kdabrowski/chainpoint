source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'httparty', '~> 0.17.3'
gem 'jbuilder', '~> 2.5'
gem 'pg', '~> 1.2.3'
gem 'puma', '~> 3.11'
gem 'rails', '~> 6.1.4'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'uuid', '~> 2.3.9'

group :development, :test do
  gem 'rspec-rails', '~> 5.0.0'
  gem 'pry', '0.14.1'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'webmock', '~> 3.14.0'
  gem 'rspec', '~> 3.10.0'
  gem 'shoulda-matchers', '~> 5.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
