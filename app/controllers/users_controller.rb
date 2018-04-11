class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_attributes)
    if @user.save
      session[:user_id] = @user.id
      redirect_to profiles_path
    else
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  private

  def user_attributes
    params.require(:user).permit(:username, :password, :email)
  end
end
