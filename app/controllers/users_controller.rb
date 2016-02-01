class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to sign_in_path
    else
      flash[:danger] = "Invalid email or password"
      render :new
    end
  end

  def show
    @reviews = current_user.reviews
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end
end
