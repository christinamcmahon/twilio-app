class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :avatar, :name, :bio
end
