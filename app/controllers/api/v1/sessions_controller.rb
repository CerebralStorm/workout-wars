class Api::V1::SessionsController < Api::V1::BaseController 
  before_filter :ensure_params_exist, only: :create
  skip_before_filter :authenticate_user!, only: :create
  skip_before_filter :verify_authenticity_token 
 
  respond_to :json

  def new
  end

  def create    
    user = User.find_for_database_authentication(email: params[:email])
    return invalid_login_attempt unless user
 
    if user.valid_password?(params[:password])
      user.ensure_authentication_token!
      sign_in("user", user)
      render json: { success: true, auth_token: user.authentication_token, email: user.email }
      return
    end
    invalid_login_attempt
  end
  
  def destroy
    user = User.find_by(authentication_token: params[:auth_token])
    user.reset_authentication_token!
    sign_out(user)
    render json: { success: true }
  end
 
  protected
  def ensure_params_exist
    return unless params[:email].blank?
    render json: { success: false, message: "missing email parameter" }, :status=>422
  end
 
  def invalid_login_attempt
    warden.custom_failure!
    render json: { success: false, message: "Error with your email or password" }, :status=>401
  end
end