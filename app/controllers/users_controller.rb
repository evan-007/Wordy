class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :get_user, only: [:show, :map]
  
  def show
  end

  def map
    @users = User.all.localized
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
  end


  private

    def get_user
      @user = current_user
    end
end
