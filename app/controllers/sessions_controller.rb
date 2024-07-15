class SessionsController < ApplicationController

  skip_before_action :require_authenticated_user, except: :destroy

  def new
    if current_user.present?
      redirect_to reviews_path
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to reviews_path
    else
      flash[:alert] = "Email or password is invalid"
      redirect_to new_session_path
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil

    redirect_to new_session_path
  end
end
