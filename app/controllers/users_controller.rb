class UsersController < ApplicationController
	before_action :get_user, only: [:show, :edit, :update]
  def show
  end


  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "Thanks for signing up!"
  	else
  		flash[:notice] = "Please fill out the form"
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @user.update(user_params)
  		flash[:notice] = "Account updated!"
  		render :edit
  	else
  		flash[:notice] = "Didn't update!"
  		render :edit
  	end
  end


  private
    def user_params
    	params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def get_user
    	@user = User.find(params[:id])
    end
end
