class Identity
  include Mongoid::Document
  include Mongoid::Timestamps
  include OmniAuth::Identity::Models::Mongoid

  field :name, type: String
  field :email, type: String
  field :password_digest, type: String


  validates_presence_of :name
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\Z/i
end
