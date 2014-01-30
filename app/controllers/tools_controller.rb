class ToolsController < ApplicationController
	def report
	end

	def results
		@results = WordSearch.new.search((params[:text]))
	end

	
end
