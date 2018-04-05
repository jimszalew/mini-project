class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.username}"
    end
  end

  # def create
  #   @user = User.find_by(username: params[:session][:username])
  #   if @user && @user.authenticate(params[:session][:password])
  #     session[:user_id] = @user.id
  #     flash[:notice] = "Successful Login"
  #     if @user.role == "Restaurant"
  #       redirect_to restaurant_path(@user)
  #     elsif @user.role == "Sales Rep"
  #       redirect_to sales_rep_path(@user)
  #     else
  #       render 'public/404'
  #     end
  #   else
  #   end
  # end

  def destroy
    session.clear
    flash[:notice] = "See you next time!"
    redirect_to root_path
  end
end
