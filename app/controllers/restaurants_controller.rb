class RestaurantsController < ApplicationController
	before_filter :ensure_logged_in, only: [:create, :destroy]
  def index
  	@restaurants = Restaurant.all
  end

  def show
  	@restaurant = Restaurant.find(params[:id])

  	if current_user
  		@reservation = Reservation.new
  	end
  end

  def new
  	@restaurant = Restaurant.new
  end

  def edit
  	@restaurant = Restaurant.find(params[:id])
  end

  def create
  	
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id

  	if @restaurant.save
  	  redirect_to restaurants_path
    else
  	  render "new"
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update_attributes(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :price, :type, :photo, :capacity)
  end
end
