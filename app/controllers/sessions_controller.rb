class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      flash[:success] = "You've successfully logged in!"
      session[:user_id] = user.id
      redirect_to home_path
    else
      flash[:danger] = "Incorrect email or password"
      render :new
    end
  end

end
