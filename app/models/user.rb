class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	devise :omniauthable, :omniauth_providers => [:facebook]

	has_many :quizzes, dependent: :destroy
	has_many :categories, dependent: :destroy
	has_many :userlists
	has_many :lists, through: :userlists, dependent: :destroy
	has_attached_file :avatar, styles: { medium: "300x300", thumb: "25x25" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	after_create :default_lists
	geocoded_by :city
	after_validation :geocode, if: :city_changed?
	scope :localized, -> { where.not(latitude: nil) }

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

	def default_lists
		self.lists.create(name: 'Beginner', user_id: self.id)
		self.lists.create(name: 'Intermediate', user_id: self.id)
		self.lists.create(name: 'Advanced', user_id: self.id)
		add_words
	end

	def add_words
		Word.all.each do |word|
			list = self.lists.shuffle[0]
			word.lists.push(list)
		end
	end
  
  def self.find_for_facebook_oauth(auth)
  where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.city = auth.info.locale
      user.password = Devise.friendly_token[0,20]
      user.avatar = auth.info.image # assuming the user model has an image
    end
  end
end