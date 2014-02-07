class LampPara
  include Mongoid::Document

  DEMOS = %w[飞利浦  欧司朗 其它]

  field :name, type: String
  field :value, type: String
  field :note, type: String

  embedded_in :lamp_set
end
