class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :require_login

  def is_media?
  end

  def is_source?
    current_user.user_role_id == 2
  end

  private
  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end

end
