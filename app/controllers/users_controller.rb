class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
    @reservations = @user.reservations
    @restaurants = @user.restaurants
	end

	def create
  	@user = User.new(user_params)
  	  if @user.save
      session[:user_id] = @user.id
  		redirect_to user_path(@user), notice: "Hello, #{@user.name}!"
  	  else 
  		render "new"
  	  end
    end

    private
    def user_params
  	  params.require(:user).permit(:email, :password, :password_confirmation, :name)
    end

end
