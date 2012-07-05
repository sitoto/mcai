class Admin::Event
  include Mongoid::Document
  field :name, :type => String
  field :status, :type => String
  field :created_at, :type => Time
end
