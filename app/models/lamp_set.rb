class LampSet
  include Mongoid::Document
  field :name, type: String
  field :volts, type: String #伏

  field :watts, type: String #瓦
  field :base, type: String #灯头

  field :style, type: String #系列
  field :note, type: String

  embeds_many :lamp_paras
end
