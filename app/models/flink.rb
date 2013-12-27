class Flink
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :url, type: String
  field :image, type: String
  field :description, type: String
  field :position, type: Integer, default: 10
  field :published,  type: Mongoid::Boolean , default: false

  validates_presence_of :name, :url

  belongs_to :user

  scope :published, -> { where(:published  => true) }

end
