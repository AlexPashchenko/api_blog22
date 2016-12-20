class PostSerializer < ActiveModel::Serializer
  attributes :id, :text, :status
  has_many :comments

end
