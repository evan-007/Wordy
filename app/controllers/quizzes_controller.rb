class QuizzesController < ApplicationController
	before_action :get_categories, only: [:index, :new]
	before_action :get_quiz, only: [:results, :review]
	before_filter :authenticate_user!


	def index
		@quizzes = current_user.quizzes.order('created_at DESC')
	end

	def new
		@quiz = current_user.quizzes.build
	end

	def show 
		@quiz = current_user.quizzes.find(params[:id])
		@questions = @quiz.questions
	end

	def create
		@quiz = current_user.quizzes.build(quiz_params)
		if @quiz.save
			flash[:notice] = "Quiz created"
			redirect_to quizzes_path
		else
			flash[:notice] = "Quiz was not created"
			redirect_to new_quiz_path
		end
	end

	def results
	end

	def destroy
		@quiz = Quiz.find(params[:id])
		@quiz.destroy
		flash[:alert] = "Quiz deleted!"
		redirect_to quizzes_path
	end

	def review
	end



	private
		def get_quiz
			@quiz = current_user.quizzes.find(params[:quiz_id])
		end


		def quiz_params
			params.require(:quiz).permit(:name, :category_id)
		end

		def get_categories
			@categories = Category.all
		end
end
