class QuestionsController < ApplicationController
	before_action :get_question!

	def edit
	end

	def answer
	end

	def grade
			if @question.update(question_params) && @question.guess == @question.word
				@question.update(correct: true)
			flash[:notice] = "Good job, here's the next one"
			redirect_to question_answer_path(question_id: (@question.id+1))
			#this is a bad way to do it - how to make it stop at the right number?
			#use act as list gem?
		else 
			flash[:notice] = "Read the next one a bit closer"
			redirect_to question_answer_path(question_id: (@question.id+1))
		end
	end

	def update
		if @question.update(question_params) && @question.guess == @question.word
			flash[:notice] = "Good job, here's the next one"
			redirect_to question_answer_path(question_id: (@question.id+1))
			#this is a bad way to do it - how to make it stop at the right number?
			#use act as list gem?
		else 
			flash[:notice] = "Read the next one a bit closer"
			redirect_to question_answer_path(question_id: (@question.id+1))
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
