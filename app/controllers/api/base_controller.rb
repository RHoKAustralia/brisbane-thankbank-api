class Api::BaseController < ActionController::Base
  before_action :authenticate_app
  before_action :sign_in_user

  private

  def authenticate_app
    auth_token = request.headers["X-AUTH-TOKEN"]
    if auth_token.present? && auth_token != IOS_TOKEN
      render json: { message: 'Unauthorized App', code: 401 }, status: :unauthorized
      return
    end
  end

  def sign_in_user
    user = User.find_by(facebook_uid: user_attributes[:facebook_uid])
    if user
      sign_in(user, bypass: true)
    else
      render json: { message: 'Unauthorized User', code: 401 }, status: :unauthorized
      return
    end
  end

  def user_attributes
    {
      facebook_uid: params[:facebook_uid]
    }
  end
end
