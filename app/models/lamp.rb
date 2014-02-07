class Lamp
  include Mongoid::Document
  include Mongoid::Timestamps
  before_save :uppercase_field
  before_validation do |model|
      model.high_beam.reject!(&:blank?) if model.high_beam
      model.low_beam.reject!(&:blank?) if model.low_beam
      model.fog_light.reject!(&:blank?) if model.fog_light

  end

  field :emaker, type: String
  field :maker, type: String
  field :ebrand, type: String
  field :brand, type: String
  field :model, type: String
  field :model_alias, type:Array, default: []

  field :begin_year, type: String
  field :end_year, type: String

  field :lamp_head, type: String #灯座

  field :high_beam, type: Array, default: []
  field :low_beam, type: Array, default: [] 
  field :fog_light, type: Array, default: [] 

  field :rear_fog_light, type: String
  field :front_signal, type: String
  field :front_turn_signal, type: String
  field :rear_turn_signal, type: String
  field :side_turn_signal, type: String

  field :brake_light, type: String
  field :high_brake_light, type: String
  field :reversing_lamp, type: String #倒车灯


  field :note, type: String
  validates_presence_of :brand, :model

  belongs_to :user

  index({:brand => 1, :model => 1})

  scope :car, -> { asc(:brand, :model) }

  def uppercase_field
    self.emaker.upcase! if self.emaker
    self.ebrand.upcase! if self.ebrand

    self.maker.upcase!
    self.model.upcase!

    self.model_alias <<  self.ebrand
    self.model_alias <<  self.brand
    self.model_alias <<  self.emaker
    self.model_alias <<  self.model
    self.model_alias <<  "#{self.maker}#{self.model}" 
    self.model_alias <<  "#{self.maker} #{self.model}" 
    self.model_alias <<  "#{self.maker}　#{self.model}" 
    self.model_alias <<  "#{self.brand}#{self.model}" 
    self.model_alias <<  "#{self.brand} #{self.model}" 
    self.model_alias <<  "#{self.brand}　#{self.model}" 


    self.model_alias.uniq!
  end
end
