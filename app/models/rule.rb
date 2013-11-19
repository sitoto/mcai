class Rule
  include Mongoid::Document
  field :name, :type => String
  field :url_regular#, :type => Regexp
  field :note, :type => String

  VALID_DOUBAN_REGEX_1 = /douban\.com\/group\/topic\/[0-9]*/


  has_many :tasks
end
