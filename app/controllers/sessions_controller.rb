class SessionsController < ApplicationController

  def new
    redirect_to home_path if logged_in?
  end

  def create
    user = User.find_by_email(params[:email])
    binding.pry
    if user&.authenticate(params[:password])
      flash[:success] = "You've successfully logged in!"
      session[:user_id] = user.id
      redirect_to home_path
    else
      flash[:danger] = "Incorrect email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to home_path
  end

end
