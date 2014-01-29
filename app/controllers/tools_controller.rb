class ToolsController < ApplicationController
	def report
	end

	def results
		@results = Word_search.new.search((params[:text]))
	end

	
end
