class QuizzesController < ApplicationController
	# require 'question_builder.rb'
	require 'background_question.rb'
	before_action :get_user, only: [:new, :create, :show, :index]
	before_action :get_all_lists, only: [:new]
	before_action :get_categories, only: [:index, :new]


	def index
		@quizzes = current_user.quizzes
	end

	def new
		@quiz = @user.quizzes.build
	end

	def show
		@quiz = @user.quizzes.find(params[:id])
	end

	def create
		@quiz = @user.quizzes.build(quiz_params)
		if @quiz.save
			# Delayed::Job.enqueue(QuestionJob.new([@user, @quiz])) #this doesn't work, params..
			@quiz.category.words.each do |w|
				build_questions(w)
				end
			flash[:notice] = "Quiz created"
			redirect_to [@user, @quiz]
		else
			flash[:notice] = "Quiz was not created"
			redirect_to new_user_quiz_path
		end
	end

	def results
	end


	private
		def get_quiz
			@quiz = @user.quizzes.find(params[:id])
		end

		def get_user
			@user = current_user
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
