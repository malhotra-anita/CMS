class UserSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :role
end
