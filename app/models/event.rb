class Event
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  field :name, :type => String
  field :status, :type => String
  field :from_ip, :type => String

  # belongs_to :user
  
  belongs_to :article

end
