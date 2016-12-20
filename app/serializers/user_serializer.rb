class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :login, :email, :age, :token
  has_many :posts
  has_many :comments
  has_many :platforms
  has_many :devises
end
