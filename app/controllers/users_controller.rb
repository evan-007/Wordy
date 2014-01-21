class UsersController < ApplicationController
	before_action :get_user, only: [:show, :edit, :update]
  def show
  end


  def new
  	@user = User.new
  end

  def edit
  end


  private

    def get_user
    	@user = User.find(params[:id])
    end
end
