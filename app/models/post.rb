#encoding: utf-8
class Post
  include Mongoid::Document
  field :author, :type => String
  field :created_at, :type => String
  field :level, :type => Integer
  field :my_level, :type => Integer
  field :content, :type => String
  field :words_count, :type => Integer

  embedded_in :topic
end
