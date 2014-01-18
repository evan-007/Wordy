class ListsController < ApplicationController
  before_action :set_user, only: [:new, :create, :show, :destroy]
  before_action :find_list, only: [:show, :destroy]
  def show
  end

  def new
    @list = @user.lists.build
  end

  def create
    @list = @user.lists.build(list_params)
    if @list.save
      flash[:notice] = "List created"
      redirect_to [@user, @list]
    else
      flash[:notice] = "List was not created"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @list.destroy
    flash[:notice] = "List deleted!"
    redirect_to @user
  end

  private
    def find_list
      @list = @user.lists.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:name)
    end

    def set_user
      @user = current_user
    end
end