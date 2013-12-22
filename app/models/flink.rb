class Flink
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :url, type: String
  field :image, type: String
  field :description, type: String
  field :postion, type: Integer, default: 10

  validates_presence_of :name

  belongs_to :user

end
