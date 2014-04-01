#encoding: UTF-8
class Page
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, :type => String
  field :permalink, :type =>String
  field :keywords, :type => String
  field :description, :type => String
  field :body, :type => String

  scope :notice, where(:title => "公告") 
  scope :about, where(:title => "关于") 
  scope :ad1, where(:title => "ad1") 


end
