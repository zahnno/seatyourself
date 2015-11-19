class ReservationsController < ApplicationController
	before_filter :ensure_logged_in, only: [:create, :destroy]

  def index
   
  end

  def new
  @reservation = Reservation.new
  @restaurant = Restaurant.find_by(params[:restaurant_id])
  end 

  def show
  	@reservation = Reservation.find(params[:id])
  end

  def create
  	# @review = @product.reviews.build(review_params)
   #  @review.user = current_user

      @reservation = Reservation.new(
      capacity: params[:reservation][:capacity],
      time: params[:reservation][:time],
      restaurant_id: @restaurant.id,
      user_id: current_user.id
     )    


    if @reservation.save
    	redirect_to restaurant_path(@restaurant), notice: 'Reservation Set!'
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
  	params.require(:reservation).permit(:capacity, :time, :restaurant_id)
  end

  # def load_product
  # 	@product = Product.find(params[:product_id])
  # end
end
