class Lamp
  include Mongoid::Document
  include Mongoid::Timestamps
  before_save :uppercase_field

  field :emaker, type: String
  field :maker, type: String
  field :model, type: String
  field :model_alias, type:Array, default: []
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

  index({:maker => 1, :model => 1})

  scope :car, -> { asc(:maker, :model) }

  def uppercase_field
    self.emaker.upcase!
    self.maker.upcase!
    self.model.upcase!

    self.model_alias <<  self.emaker
    self.model_alias <<  self.maker
    self.model_alias <<  self.model
    self.model_alias <<  "#{self.maker} #{self.model}" 
    self.model_alias <<  "#{self.maker}　#{self.model}" 

    self.model_alias.uniq!
  end
end
