class Admin::Task
  include Mongoid::Document
  field :name, :type => String
  field :type, :type => String
  field :status, :type => String
  field :assign, :type => String
  field :content, :type => String
end
