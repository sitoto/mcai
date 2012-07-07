class Html
  include Mongoid::Document
	include Mongoid::Timestamps

  field :url, :type => String
  field :body, :type => String
	field :status, :type => String
	field :top, :type => Integer

end
