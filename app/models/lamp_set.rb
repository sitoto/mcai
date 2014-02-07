class LampSet
  include Mongoid::Document
  field :name, type: String
  field :style, type: String
  field :note, type: String

  embeds_many :lamp_paras
end
