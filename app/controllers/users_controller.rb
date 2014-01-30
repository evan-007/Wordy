class UsersController < ApplicationController
  before_action :get_sys_lists, only: [:show]
  before_filter :authenticate_user!
  
  def show
    @user = current_user
  end


  def new
  	@user = User.new
  end

  def edit
  end


  private

    def get_sys_lists
      @lists = List.all.where(params[:id] < '4')
    end
end
