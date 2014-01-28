class QuestionsController < ApplicationController
	before_action :get_question!


	def answer
	end

	def grade
		@question.update(question_params)
		if @question.lower_item == nil
			redirect_to quiz_results_path(quiz_id: @question.quiz_id)
		else
			flash[:notice] = "Here's the next one"
			redirect_to question_answer_path(question_id: (@question.lower_item.id))
		end
	end

	private

	  def get_quiz!
	  	@quiz = current_user.quizzes.find(params[:quiz_id])
	  end

	  def get_question!
	  	@question = Question.find(params[:question_id])
	  end

	  def question_params
	  	params.require(:question).permit(:guess)
	  end
end
