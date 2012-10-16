class Article
  include Mongoid::Document
  include Mongoid::Timestamps
	
  # custome
  field :mytitle, :type => String
  field :mydescription, :type => String
  field :tags, :type => Array, default: []
  field :only_author, :type => Boolean, default: true
 	field :published, :type => Boolean, default: true
  # from web
  field :title, :type => String
  field :author, :type => String
  field :first_time, :type => String
  field :last_time, :type => String
  field :from_name, :type => String
  field :from_url, :type => String
  field :last_url, :type => String
  field :from_ip, :type => String
  # tong ji
  field :pages_count, :type => Integer, default: 1
  field :posts_count, :type => Integer, default: 1
  field :words_count, :type => Integer, default: 100
	field :like_count, :type => Integer, default: 0

	scope :recent, where(:published => true).desc(:created_at).limit(12)

  has_many :topics
end
