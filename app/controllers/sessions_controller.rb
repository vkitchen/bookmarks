# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :require_login

  layout 'login'

  def create
    @user = User.find_by(username: params[:username])

    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      message = 'Login failed'
      redirect_to login_path, notice: message
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url
  end
end
