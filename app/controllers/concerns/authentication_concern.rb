module AuthenticationConcern
  extend ActiveSupport::Concern

  included do
    before_action :get_tokens
    before_action :authenticate_using_token
    before_action :get_user_from_jwt_token
  end

  def get_tokens
    binding.pry
  end

  def authenticate_using_token
  end

  def get_user_from_jwt_token
  end
end
