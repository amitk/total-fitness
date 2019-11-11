class Api::V1::SessionsController < Api::V1::BaseController
  skip_before_action :get_tokens, only: [:create]
  skip_before_action :authenticate_using_token, only: [:create]

  def create
    user = User.find_by(email: params[:email], password: params[:password])
    if user
      @current_user = user
      render_success(data: {
        user: serialize_resource(user, ::V1::UserSerializer),
        message: I18n.t('model.session.success'),
      })
    else
      render_error(message: I18n.t('model.session.failure'), status: :unprocessable_entity)
    end
  end

  def destroy
  end
end
