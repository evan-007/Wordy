class WordlistsController < ApplicationController
	def create
		@wordlist = Word.find(params[:word]).wordlists.build(list: params[:list])
		if @wordlist.save
			flash[:notice] = "Added to list"
			redirect_to root_path
		else
			flash[:error] = "Can't add that word"
		end
	end

	def destroy
	end

	private

	  def wordlist_params
	  	params.require(:wordlist).permit(:word, :list)
	  end

	  def find_word
	  	@word = Word.find(params[:id])
	  end
end
