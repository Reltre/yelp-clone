class UsersController < ApplicationController
  def new
    @user = User.new
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
    @user = User.find(params['id'])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end
end
