class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def authorize
    redirect_to root_path and return if not is_logged_in
  end

  def is_logged_in
    cookies[:can_has] == "yarly"
  end
end
