class Quiz < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	belongs_to :list
	validates :name, presence: true
	has_many :questions
	after_create :get_examples
	self.per_page = 10
	after_update :count, if: :finished_changed?

	def get_questions
		@id = self.id
		self.category.words.each do |w|
			build_questions(w)
		end
	end

	def get_examples
		@id = self.id
		self.category.words.each do |w|
			answer_array = [w.name]
			w.categories.first.words.where.not(name: w.name).sample(3).each do |word|
				answer_array << word.name
				end
			
			answer_array

			offset = rand(w.examples.count)
			rand_example = w.examples.first(offset: offset)

			q = Question.create(word: w.name, quiz_id: @id, text: rand_example.text, answer: answer_array)
		end
	end

    private
		def count
			if self.user.quizzes.count % 5 == 0
				UserMailer.quiz_mail(self.user).deliver
			end
		end
end