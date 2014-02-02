class Lamp
  include Mongoid::Document
  include Mongoid::Timestamps

  field :emaker, type: String
  field :maker, type: String
  field :model, type: String
  field :begin_year, type: String
  field :end_year, type: String
  field :high_beam, type: String
  field :low_beam, type: String
  field :fog_light, type: String
  field :front_signal, type: String
  field :front_turn_signal, type: String
  field :rear_turn_signal, type: String
  field :brake_light, type: String
  field :side_turn_signal, type: String
  field :note, type: String

  belongs_to :user

end
