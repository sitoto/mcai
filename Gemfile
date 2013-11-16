# coding: utf-8
source 'http://ruby.taobao.org'

gem 'rails', '4.0.0.rc2'

gem 'sass-rails', "~> 4.0.0"
gem 'coffee-rails', "~> 4.0.0"
gem 'uglifier', '>= 1.3.0'

gem "rails-i18n","0.1.8"
gem "jquery-rails", "3.0.4"


gem "wmd-rails"
gem "redcarpet"

# Mongoid 辅助插件
gem "mongoid", github: 'mongoid/mongoid', ref: '11e45e5a30a45458b83db99ab6c9d9ccc337e66f'
#gem 'mongoid_auto_increment_id', "0.6.2"
#gem 'mongoid_rails_migrations', '1.0.0'

gem 'kaminari', '0.14.0'
gem 'anjlab-bootstrap-rails', '~> 3.0.1.0', require: 'bootstrap-rails'
#gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails',
#  :git => 'git://github.com/anjlab/bootstrap-rails.git'
gem "meta-tags"#, :require => "meta-tags", :git => "git://github.com/kpumuk/meta-tags.git"

# 分享功能
gem "social-share-button", '0.1.4'
# 表单
gem 'simple_form', "3.0.0.rc"
gem 'omniauth-identity'
gem 'omniauth-weibo-oauth2'

gem 'nokogiri'

gem 'delayed_job_mongoid',   :git => 'git://github.com/sitoto/delayed_job_mongoid.git'
gem "daemons"


#  :path => "/home/administrator/sites/delayed_job_mongoid"
group :development, :test do 
  gem "capistrano", '2.9.0', require: false
  gem 'rvm-capistrano', require: false
  gem 'rspec-rails', '~> 2.13.2'
  gem 'factory_girl_rails'
end
group :production do
  gem 'unicorn'
end
