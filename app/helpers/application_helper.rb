module ApplicationHelper
  def user
    @user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
  end
end
