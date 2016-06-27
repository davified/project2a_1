class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :user_logged_in?

  def current_user
    User.find(session[:user_id]) unless session[:user_id].blank?
  end

  def user_logged_in?
    current_user.present?
  end

  def authenticate_user
    unless user_logged_in?
      flash[:error] = "you must login first"
      redirect_to sign_in_path
    end
  end
end
