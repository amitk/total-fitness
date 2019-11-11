module AuthenticationConcern
  extend ActiveSupport::Concern

  included do
    before_action :get_tokens
    before_action :authenticate_using_token
    before_action :get_user_from_jwt_token
    after_action :assign_tokens_to_headers
  end

  attr_reader :current_user

  def get_tokens
    @auth_token = request.headers['X-USER-AUTH-TOKEN']
    @jwt_token = request.headers['X-USER-JWT-TOKEN']
  end

  def authenticate_using_token
    payload = JWT.decode(@jwt_token, @auth_token)
    @current_user = payload
  end

  def get_user_from_jwt_token

  end

  def assign_tokens_to_headers
    response.headers['X-USER-AUTH-TOKEN'] = current_user.auth_token
    response.headers['X-USER-JWT-TOKEN'] = current_user.jwt_token
    binding.pry
  end
end
