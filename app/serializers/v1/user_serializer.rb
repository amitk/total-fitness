class V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :mobile, :email, :dob
end
