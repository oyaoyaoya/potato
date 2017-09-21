source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'devise'
gem 'rails', '~> 5.0.1'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'
gem 'seed-fu', '~> 2.3'
gem 'materialize-sass'
gem 'devise-i18n'
gem 'enum_help'
gem 'font-awesome-sass'
gem 'google-api-client', '~> 0.9'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'kaminari'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'active_decorator'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'rspec-rails', '~> 3.5'
  gem 'faker'
  gem 'rails-controller-testing'
  gem 'factory_girl_rails'
  gem 'byebug', platform: :mri
  gem 'pry-rails'  # rails console(もしくは、rails c)でirbの代わりにpryを使われる
  gem 'pry-doc'    # methodを表示
  gem 'pry-byebug' # デバッグを実施(Ruby 2.0以降で動作する)
  gem 'pry-stack_explorer' # スタックをたどれる
  gem 'capistrano'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano3-unicorn'
end

group :development do
  gem 'bullet'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'unicorn'
end
