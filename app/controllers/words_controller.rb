class WordsController < ApplicationController
	require 'will_paginate/array'
	
	before_action :get_word, only: [:edit, :update]
	# before_action :get_list

	def show
		@word = Word.find_by_name(params[:name])
	end

	def index
		@words = Word.paginate(:page => params[:page])
	end

	def edit
	end

	def update
		if @word.update(word_params)
			flash[:notice] = "Updated"
			redirect_to @word
		else
			flash[:notice] = "Invalid edit"
			render :edit
		end
	end

	private

	  def get_word
	  	@word = Word.find(params[:id])
	  end

	  def word_params
	  	params.require(:word).permit(:name, :definition, :pos, :ipa)
	  end

	  # def get_list
	  # 	@list = signed_in_user.lists
	  # end
end
