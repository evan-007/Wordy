class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	 # validates :name, presence: true, uniqueness: true
	has_many :lists, dependent: :destroy
	has_many :quizzes, dependent: :destroy
	has_many :categories, dependent: :destroy
	has_attached_file :avatar, styles: { medium: "300x300", thumb: "100x100" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

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

	def total_questions
		@count = []
		self.quizzes.where(finished: true).each do |quiz|
			@count << quiz.questions.count
		end
		return @count
	end

	def correct_categories
		@cat_names =[]
		self.quizzes.where(finished: true).each do |quiz|
			@cat_names << quiz.category.name
		end
		return @cat_names
	end
end
