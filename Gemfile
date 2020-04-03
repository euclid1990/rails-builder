source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.6.5"

gem "active_model_serializers"
gem "bootsnap", ">= 1.4.2", require: false
gem "composite_primary_keys"
gem "config"
gem "date_validator"
gem "devise"
gem "doorkeeper"
gem "dotenv-rails"
gem "draper"
gem "hashids"
gem "jbuilder", "~> 2.7"
gem "mysql2"
gem "pagy"
gem "paranoia"
gem "puma", "~> 4.1"
gem "rails", "~> 6.0.2", ">= 6.0.2.1"
gem "sass-rails", ">= 6"
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "webpacker", "~> 4.0"

group :development, :test do
  gem "factory_bot_rails"
  gem "ffaker"
  gem "pry-rails"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "brakeman"
  gem "bundler-audit"
  gem "rails-controller-testing"
  gem "rspec-rails"
  gem "rubocop"
  gem "rubocop-checkstyle_formatter"
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "database_cleaner"
end
