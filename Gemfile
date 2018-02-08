# coding: utf-8
source 'https://ruby.taobao.org'

gem 'rails', '5.1.4'

gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'

gem "rails-i18n"
gem "jquery-rails"


gem "wmd-rails"
gem "redcarpet"

#for wechat's xml
gem 'actionpack-xml_parser'

# Mongoid 辅助插件
gem "mongoid", '6.3.0'
#gem 'mongoid_auto_increment_id', "0.6.2"
#gem 'mongoid_rails_migrations', '1.0.0'

gem 'kaminari'
gem 'bootstrap-sass'

gem "meta-tags"#, :require => "meta-tags", :git => "git://github.com/kpumuk/meta-tags.git"

gem 'omniauth'

# 分享功能
gem "social-share-button"
# 表单
gem 'simple_form'
gem 'omniauth-identity'
gem 'omniauth-weibo-oauth2'

gem 'nokogiri'

gem 'delayed_job_mongoid', '2.3.0'
gem "daemons"


#  :path => "/home/administrator/sites/delayed_job_mongoid"
group :development, :test do
  gem "capistrano"
  gem 'rspec-rails'
end
group :production do
  gem 'unicorn', '5.4.0'
end
