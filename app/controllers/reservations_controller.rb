class ReservationsController < ApplicationController
	before_filter :ensure_logged_in, only: [:create, :destroy]

  def index
   
  end

  def new
  @reservation = Reservation.new
  @restaurant = Restaurant.find_by(params[:restaurant_id])
  end 

  def show
    @restaurant = Restaurant.find(params[:id])
  	@reservation = Reservation.find(params[:id])
  end

  def create
    if 50 <= @restaurant_capacity
      @reservation = Reservation.new(reservations_params)
     #  guests: params[:reservation][:guests],
     #  time: params[:reservation][:time],
     #  restaurant_id: @restaurant_id,
     #  user_id: current_user.id
     # ) 
    else 
      render "restaurant/show"
    end
        
    if @reservation.save
    	redirect_to user_path(current_user), notice: 'Reservation Set!'
    else
    	render 'restaurants/show'
    end
  end

  def destroy
  	@reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to restaurant_path(@reservation.product)
  end

  private 
  def reservation_params
  	params.require(:reservation).permit(:guests, :time, :restaurant_id, :user_id)
  end

  # def load_product
  # 	@product = Product.find(params[:product_id])
  # end
end
