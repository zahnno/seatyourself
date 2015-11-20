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
      @reservation = Reservation.new(reservations_params)
        
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
end
