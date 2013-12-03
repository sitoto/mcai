class Rule
  include Mongoid::Document
  field :name, :type => String
  field :url_regular#, :type => Regexp
  field :note, :type => String

  #douban
  VALID_DOUBAN_REGEX_1 = /douban\.com\/group\/topic\/[0-9]*/
  #tianya
  # http://bbs.tianya.cn/post-stocks-1165971-1.shtml
  VALID_TIANYA_REGEX_1 = /bbs\.tianya\.cn\/\w*\-\w*\-\w*\-[0-9]+\.shtml/ 


  has_many :tasks
end
