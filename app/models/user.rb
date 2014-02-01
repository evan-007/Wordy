class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	 # validates :name, presence: true, uniqueness: true
	has_many :lists, dependent: :destroy
	has_many :quizzes, dependent: :destroy
	has_many :categories, dependent: :destroy

	def finished_quizzes
		@names = []
		self.quizzes.where(finished: true).each do |quiz|
			@names << quiz.name
		end
		return @names
	end

	def correct_questions
		@count = []
		self.quizzes.where(finished: true).each do |quiz|
			@count << quiz.questions.where(correct: true).count
		end
		return @count
	end
end
