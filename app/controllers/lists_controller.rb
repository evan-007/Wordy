class ListsController < ApplicationController
  before_action :current_user
  before_action :find_list, only: [:show, :destroy, :edit, :update]
  before_action :get_wordlists, only: [:edit]
  def show
  end

  def index
    @lists = current_user.lists
  end

  def new
    @list = current_user.lists.build
  end

  def create
    @list = List.create(list_params)
    Userlist.create(list_id: @list.id, user_id: current_user.id)
    @list.update(user_id: current_user.id) if current_user
    if @list.save
      WordSearch.new.get_words((params[:words]), @list.id)
      flash[:notice] = "List created"
      redirect_to @list
    else
      flash[:notice] = "List was not created"
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      WordSearch.new.get_words((params[:words]), @list.id)
      flash[:notice] = "List updated"
      redirect_to @list
    else
      flash[:notice] = "List was not updated"
      redirect_to edit_list_path(@list)
    end
  end

  def destroy
    if @list.destroy

      respond_to do |format|
        format.html {
          flash[:notice] = "List deleted!"
          redirect_to lists_path}
        format.js
      end
    else
      flash[:notice] = "List wasn't deleted?!"
      redirect_to lists_path 
    end
  end

  private
    def find_list
      @list = current_user.lists.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:name, :user_id)
    end

    def get_wordlists
      @wordlists = @list.wordlists
    end
end
