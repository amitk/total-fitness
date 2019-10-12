class Api::V1::UsersController < Api::V1::BaseController

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
    user = new User(user_params)
    if user.save
      render_success(data: {
        user: serialize_resource(user, ::V1::UserSerializer),
        message: I18n.t('user.create.success', model_name: 'User')
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
      if user.update
        render_success(data: {
          user: serialize_resource(user, ::V1::UserSerializer),
          message: I18n.t('user.update.success', model_name: 'User')
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
    params.required(:user).permit([:name, :mobile, :email, :dob])
  end
end
