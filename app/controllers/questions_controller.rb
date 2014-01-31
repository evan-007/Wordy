class QuestionsController < ApplicationController
	before_action :get_question!
	before_filter :authenticate_user!


	def answer
	end

	def grade
		@question.update(question_params)
		if @question.lower_item == nil
			@question.quiz.update(finished: true) #not in controller?
			redirect_to quiz_results_path(quiz_id: @question.quiz_id)
		else
			redirect_to question_answer_path(question_id: (@question.lower_item.id))
		end
	end

	private

	  def get_question!
	  	@question = Question.find(params[:question_id])
	  end

	  def question_params
	  	params.require(:question).permit(:guess)
	  end
end
