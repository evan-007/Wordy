class ListsController < ApplicationController
  before_action :current_user
  before_action :find_list, only: [:show, :destroy]
  def show
  end

  def sys_list
    @list = List.find_by_name(params[:name])
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
      @list = current_user.lists.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:name)
    end
end
