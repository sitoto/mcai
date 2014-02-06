class Weixin
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :ask, type: String
  field :answer, type: String
  field :words_count, type: Integer, default: 0

end
