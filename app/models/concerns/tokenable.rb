module Tokenable
  extend ActiveSupport::Concern

  def jwt_token(exp: 7.days.from_now)
    payload = { resource_id: self.id, resource_type: self.class.to_s }
    payload[:exp] = exp.to_i

    JWT.encode(payload, self.auth_token)
  end
end
