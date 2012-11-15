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
  field :class_name, :type => String
  field :first_time, :type => String
  field :last_time, :type => String
#  field :from_name, :type => String
  field :from_url, :type => String
  field :last_url, :type => String
  field :from_ip, :type => String
  # tong ji
  field :pages_count, :type => Integer, default: 1
  field :posts_count, :type => Integer, default: 1
  field :words_count, :type => Integer, default: 1
	field :like_count, :type => Integer, default: 0
  field :hits, :type => Integer, default:  0

  has_many :topics, :dependent => :destroy

  index :mytitle => 1
  index :like_count => 1
  index :created_at => 1
  index :updated_at => 1


	scope :recent, where(:published => true).desc(:created_at).limit(12)
  scope :popular, where(:like_count.gt => 5, :published => true )

end
