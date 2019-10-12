class Api::V1::BaseController < ApplicationController
  include AuthenticationConcern

  def render_success(data: nil, message: nil, status: :ok)
    render json: { data: data, message: message }, status: status
  end

  def render_error(data: nil, message: nil, status: :internal_server_error, errors: {})
    render json: { data: data, message: message, errors: errors }, status: status
  end
end
