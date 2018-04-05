class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.username}"
      redirect_to profile_path(@user)
    end
  end

  def destroy
    session.clear
    flash[:notice] = "See you next time!"
    redirect_to root_path
  end
end
