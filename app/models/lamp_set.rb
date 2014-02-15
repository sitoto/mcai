class LampSet
  include Mongoid::Document
  before_save :uppercase_field

  field :name, type: String

  field :volts, type: String, default: '12V' #伏
  field :watts, type: String #瓦
  field :base, type: String #灯头

  field :style, type: String #系列
  field :note, type: String

  validates_presence_of :name
  validates_uniqueness_of :name


  embeds_many :lamp_paras

  index({:name => 1})

  def uppercase_field
    self.name.upcase! if self.name
  end
 
end
