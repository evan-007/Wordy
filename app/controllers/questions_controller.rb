class QuestionsController < ApplicationController
	before_action :get_user!
	before_action :get_quiz!
	
	def edit
		@question = Question.find(params[:id])
	end


	private
	  def get_user!
	  	@user = current_user
	  end

	  def get_quiz!
	  	@quiz = current_user.quizzes.find(params[:id])
	  end
end
