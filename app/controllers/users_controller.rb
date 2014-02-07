class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:user])
	end

def create
		User.create(params.require(:user).permit(:username, :password))
		redirect_to users_path
	end

	def edit
		@user = User.find(params[:user])
	end

end


  # def create
  # 	@art_car = ArtCar.new(art_car_params)

  # 	if @art_car.save
  # 		flash[:notice] = "Successfully created art car!"
  # 		redirect_to action: 'index'
  # 	else
  # 		render action: 'new'
  # 	end
  # end

 
  # def update
  #   @art_car = ArtCar.find(params[:id])

  #   if @art_car.update(art_car_params)
  #     flash[:notice] = "Successfully updated art car!"
  #     redirect_to action: 'index'
  #   else
  #     render action: 'edit'
  #   end  
  # end

  # def destroy
  #   ac = Array.find(params[:id])
  #   ac.destroy
  #   redirect_to art_cars_path
  #   flash[:notice] = "Successfully deleted art car!"

  #  end
