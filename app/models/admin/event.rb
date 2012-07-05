class Admin::Event
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  field :name, :type => String
  field :status, :type => String
end
