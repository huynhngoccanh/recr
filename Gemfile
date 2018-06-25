source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0', '>= 5.0.0.1'
gem 'pg', '~> 0.18'
gem 'puma'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks', '~> 5.x'
gem 'jbuilder', '~> 2.0'
gem "font-awesome-rails"

group :development, :test do
  gem 'byebug'
end

gem 'rake', '~> 11.3'

group :development do
  gem 'web-console', '~> 3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rails-erd'
  gem "letter_opener"
end

group :production do
  gem 'rails_12factor'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'devise', github: 'plataformatec/devise', branch: 'master'
gem 'phony_rails', '~> 0.13.0'
gem 'geocoder', '~> 1.3', '>= 1.3.1'
gem 'searchkick', '~> 1.2', '>= 1.2.1'
gem 'rails-assets-jquery-ui', source: 'https://rails-assets.org'
gem 'select2-rails', '~> 4.0', '>= 4.0.1.1'
gem 'obscenity', '~> 1.0', '>= 1.0.2'
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
gem 'carrierwave-aws', '~> 1.0', '>= 1.0.1'
gem 'mini_magick', '~> 4.5', '>= 4.5.1'
gem 'video_info', '~> 2.6', '>= 2.6.1'
gem 'faker', '~> 1.6', '>= 1.6.3'
gem "administrate", "~> 0.3.0"
gem 'kaminari', '~> 0.17.0'
gem 'redis', '~> 3.0'
gem 'devise_invitable', '~> 1.6'
gem 'mandrill-api', '~> 1.0', '>= 1.0.53'
gem 'acts_as_votable', '~> 0.10.0'
gem 'bourbon', '~> 4.2', '>= 4.2.7'
gem 'rollbar'

gem 'omniauth-facebook'
ruby '2.3.1'
