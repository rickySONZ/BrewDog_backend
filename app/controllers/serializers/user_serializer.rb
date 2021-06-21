class UserSerializer < ActiveModel::Serializer
     attributes :username, :password, :email
end
