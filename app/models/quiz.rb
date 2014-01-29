class Quiz < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	validates :name, presence: true
	has_many :questions
	after_create :get_questions

	def get_questions
		@id = self.id
		self.category.words.each do |w|
				build_questions(w)
		end
	end
end
