class UsersController < ApplicationController
	before_action :get_user, only: [:show, :edit, :update]
  before_action :get_sys_lists, only: [:show]
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

    def get_sys_lists
      @lists = List.all.where(params[:id] < '4')
    end
end
