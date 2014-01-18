class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.where(:name => params[:signin][:name]).first

  	if user && user.authenticate(params[:signin][:password])

  		session[:user_id] = user.id
  		flash[:notice] = "You're signed in"

  		redirect_to root_url
  	else
  		flash[:error] = "Enter your name and password"
  		render :new
  	end
  end

  def destroy
  	session = nil
  	flash[:notice] = "Signed out"
  	redirect_to root_url
  end
end
