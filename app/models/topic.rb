#encoding: utf-8
class Topic 
  include Mongoid::Document
	include Mongoid::Timestamps

  # custome
  field :mytitle, :type => String
  field :mydescription, :type => String
  field :tags, :type => Array, default: []
  field :only_author, :type => Boolean, default: true
 	field :published, :type => Boolean, default: true
  field :status, :type => Integer
  # from web
  field :title, :type => String
  field :author, :type => String
  field :url, :type => String
  # tong ji
  field :page_num, :type => Integer
  field :posts_count, :type => Integer, default: 0 
  field :words_count, :type => Integer, default: 100
	field :like_count, :type => Integer, default: 0

  belongs_to :article
  embeds_many :posts
end

