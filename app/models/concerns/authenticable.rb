module Authenticable
  extend ActiveSupport::Concern

  included do
    before_create :set_auth_token
  end

  def set_auth_token
    loop do
      self.auth_token = friendly_token(50)
      break if self.class.where(auth_token: auth_token).blank?
    end
  end

  def friendly_token
    rlength = (length * 3) / 4
    SecureRandom.urlsafe_base64(rlength).tr('lIO0', 'sxyz')
  end
end
