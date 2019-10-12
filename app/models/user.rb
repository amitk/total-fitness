class User < ApplicationRecord
  include Authenticable
  include Tokenable

  validates :email, :name, :mobile, presence: :true

end
