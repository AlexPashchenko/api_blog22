class DeviseSerializer < ActiveModel::Serializer
  attributes :id, :devise_name, :token

  belongs_to :user
  belongs_to :platform

end
