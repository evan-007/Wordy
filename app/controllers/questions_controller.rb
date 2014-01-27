class QuestionsController < ApplicationController
	before_action :get_user!
	before_action :get_quiz!
	before_action :get_question!

	def edit
	end

	def update
		if @question.update(question_params) && @question.guess == @question.word
				flash[:notice] = "Good job, here's the next one"
				render :edit
		else 
			flash[:notice] = "Read the next one a bit closer"
			render :edit
		end
	end


	private
	  def get_user!
	  	@user = current_user
	  end

	  def get_quiz!
	  	@quiz = current_user.quizzes.find(params[:id])
	  end

	  def get_question!
	  	@question = Question.find(params[:id])
	  end

	  def question_params
	  	params.require(:question).permit(:guess)
	  end
end
