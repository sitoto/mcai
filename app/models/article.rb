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

  field :from_name, :type => String # 'douban_group','baidu_tieba', 'tianya_bbs'
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
  has_many :events

  index :mytitle => 1
  index :like_count => 1
  index :created_at => 1
  index :updated_at => 1
  index :from_name => 1
  index :from_url => 1
  index :author => 1
  index :class_name => 1

  scope :recent, desc(:_id)

  # 推荐的话题
  scope :suggest, -> { where(:suggested_at.ne => nil).desc(:suggested_at) }
  scope :fields_for_list, -> { without(:body, :mydescription) }
  scope :high_likes, -> { desc(:like_count, :_id) }
  scope :high_posts, -> { desc(:posts_count, :_id) }
  scope :high_pages, -> { desc(:pages_count, :_id) }
  
  scope :no_reply, -> { where(:replies_count => 0) }
  scope :popular, -> { where(:like_count.gt => 5).desc(:_id) }
  scope :douban_group, -> { where(:from_name => 'douban_group') }
  scope :tianya_bbs, -> { where(:from_name => 'tianya_bbs') }

end
