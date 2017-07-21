class RestaurantsController < ApplicationController

  def new
    @restaurant = Restaurant.new()
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:success] = "#{@restaurant.name} added!"
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find_by(params[:user_id])
    flash[:success] = "Welcome, #{current_user.username}"
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name)
  end

end
