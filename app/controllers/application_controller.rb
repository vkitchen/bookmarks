# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def user
    @user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
  end

  def require_login
    return if user.blank?

    flash[:error] = 'Login required'
    redirect_to login_path
  end
end
