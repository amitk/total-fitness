class User < ApplicationRecord
  include Authenticable
  include Tokenable

  validates :email, :first_name, :last_name, :gender, :password, :mobile, presence: :true

end
