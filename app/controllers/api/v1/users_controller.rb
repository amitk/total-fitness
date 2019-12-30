class Api::V1::UsersController < Api::V1::BaseController
  skip_before_action :get_tokens, only: [:create]
  skip_before_action :authenticate_using_token, only: [:create]

  def index
    users = User.all
    render_success(data: {
      users: serialize_resource(users, ::V1::UserSerializer),
      count: users.count
    })
  end

  def show
    user = User.find(params[:id])
    render_success(data: {
      user: serialize_resource(user, ::V1::UserSerializer),
    })
  end

  def create
    user = User.new(user_params)
    if user.save
      render_success(data: {
        user: serialize_resource(user, ::V1::UserSerializer),
        message: I18n.t('model.create.success', model_name: 'User')
      })
    else
      render_failure(data: {
        message: I18n.t('model.create.failure', model_name: 'User')
      }, status: :unprocessable_entity)
    end
  end

  def update
    user = User.find(params[:id])
    if user
      if user.update(user_params)
        render_success(data: {
          user: serialize_resource(user, ::V1::UserSerializer),
          message: I18n.t('model.update.success', model_name: 'User')
        })
        return
      end
      render_failure(data: {message: I18n.t('model.update.failure', model_name: 'User')}, status: :unprocessable_entity);
    else
      render_failure(data: {message: I18n.t('model.update.failure', model_name: 'User')}, status: :unprocessable_entity);
    end
  end

  def destroy
    user = User.find(params[:id])
    if user
      if user.destroy
        render_success(data: {message: I18n.t('model.delete.success', model_name: 'User')})
        return
      end
      render_failure(data: {message: I18n.t('model.delete.failure', model_name: 'User')}, status: :unprocessable_entity)
    else
      render_failure(data: { message: I18n.t('model.delete.failure', model_name: 'User')}, status: :unprocessable_entity)
    end
  end

  private

  def user_params
    params.required(:user).permit([:first_name, :last_name, :mobile, :email, :gender, :password])
  end
end
