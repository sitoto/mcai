class Novel
  include Mongoid::Document
  field :name, type: String
  field :author, type: String
  field :published, type: Mongoid::Boolean
end
