class ReservationsController < ApplicationController
	before_filter :ensure_logged_in, only: [:create, :destroy]
  before_filter :load_restaurant

  def index   
  end

  def new
    @reservation = Reservation.new
  end 

  def show
  	@reservation = Reservation.find(params[:id])
  end

  def create
      @reservation = Reservation.new(reservation_params)
      # guests: params[:reservation][:guests],
      # time: params[:reservation][:time],
      # restaurant_id: @restaurant.id,
      # user_id: current_user.id,
      

      @reservation.restaurant = @restaurant
      @reservation.user = current_user


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
  	params.require(:reservation).permit(:guests, :time)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
