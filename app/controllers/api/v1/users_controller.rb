require "open-uri"

class Api::V1::UsersController < Api::BaseController
  skip_before_action :sign_in_user, only: [:create]

  def create
    user                       = User.new(user_attributes)
    user.password              = new_user_password
    user.password_confirmation = new_user_password

    if user.save
      render json: { user: { id: user.id }, code: 200 }, status: :ok
    else
      render json: { message: user.errors.full_messages.join(' '), code: 422 }, status: 422
    end
  end

  private

  def user_attributes
    new_params = params.require(:user).permit(:email, :facebook_uid, :first_name, :last_name)

    if params[:user].present? && params[:user][:avatar_url].present?
      new_params[:avatar] = open(params[:user][:avatar_url])
    end

    new_params
  end

  def new_user_password
    @new_password ||= Devise.friendly_token
  end
end
