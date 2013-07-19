class Task
  include Mongoid::Document
  field :name, :type => String
  field :web_url, :type => String
  field :verification, :type => Boolean, :default => false
  field :status, :type => String
  field :exec_num, :type => Integer

  belongs_to :rule
end
