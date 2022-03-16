class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'new'
    end
  end

  def update
    @restaurant.update(restaurant_params)
  end


  def edit
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurant_path
  end


end

private

def restaurant_params
  params.require(:restaurant).permit(:name, :address, :phone_number, :category)
end

def set_restaurant
  @restaurant = Restaurant.find(params[:id])
end
