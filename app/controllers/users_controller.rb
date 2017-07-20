class UsersController < ApplicationController

  def new
    @user = User.new
    @roles = User.roles.reject{|k, v| k == "Admin"}
  end

  def create
    @user = User.new(user_attributes)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.username}!"
      if @user.role == "Restaurant"
        redirect_to new_restaurant_path
      elsif @user.role == "Sales Rep"
        redirect_to new_sales_rep_path
      else
        render :new
      end
    else
    end
  end

  def show
    @restaurant = Restaurant.new()
    @sales_rep = SalesRep.new()
  end

  private

  def user_attributes
    params.require(:user).permit(:username, :password, :role)
  end
end
