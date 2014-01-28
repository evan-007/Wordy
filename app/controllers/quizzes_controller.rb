class QuizzesController < ApplicationController
	before_action :get_all_lists, only: [:new]
	before_action :get_categories, only: [:index, :new]
	before_action :get_quiz, only: [:results]


	def index
		@quizzes = current_user.quizzes
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
			# Delayed::Job.enqueue(QuestionJob.new([@user, @quiz])) #this doesn't work, params..
			@quiz.category.words.each do |w|
				build_questions(w)
				end
			flash[:notice] = "Quiz created"
			redirect_to @quiz
		else
			flash[:notice] = "Quiz was not created"
			redirect_to new_quiz_path
		end
	end

	def results
	end



	private
		def get_quiz
			@quiz = current_user.quizzes.find(params[:quiz_id])
		end

		def get_all_lists
			a = current_user.lists.all
			List.all.each do |l|
				if l.id < 4
					a << l
				end
			end
			@all_lists = a
		end

		def quiz_params
			params.require(:quiz).permit(:name, :category_id)
		end

		def get_categories
			@categories = Category.all
		end
end
