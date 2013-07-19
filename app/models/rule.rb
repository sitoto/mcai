class Rule
  include Mongoid::Document
  field :name, :type => String
  field :url_regular#, :type => Regexp
  field :note, :type => String

  has_many :tasks
end
