class V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :gender, :email, :mobile
end
