class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.username}"
      if @user.role.name = "vendor"
        redirect_to vendor_profile_path(@user)
      elsif @user.role.name = "customer"
        redirect_to customer_profile_path(@user)
      end
    end
  end

  def destroy
    session.clear
    flash[:notice] = "See you next time!"
    redirect_to root_path
  end
end
