class WordlistsController < ApplicationController
	before_action :find_wordlist, only: [:destroy]
	def create
		@wordlist = Word.find(params[:word]).wordlists.build(list_id: params[:list])
		if @wordlist.save
			flash[:notice] = "Added to your list"
			redirect_to root_path
		else
			flash[:error] = "Can't add that word"
			redirect_to root_path
		end
	end

	def destroy
		# @list_id = @wordlist.list_id
		@wordlist.destroy

		respond_to do |format|
			format.html {
          flash[:notice] = "List deleted!"
          redirect_to edit_list_path(@list_id) }
            format.js
        end
	end

	private

	  def wordlist_params
	  	params.require(:wordlist).permit(:word, :list)
	  end

	  def find_word
	  	@word = Word.find(params[:id])
	  end

	  def find_wordlist
	  	@wordlist = Wordlist.find(params[:id])
	  end
end
