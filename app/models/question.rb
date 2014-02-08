class Question < ActiveRecord::Base
	belongs_to :quiz
	serialize :answer,Array
	before_update :grade
	acts_as_list scope: :quiz
	scope :correct, -> { where(correct: true) }

	def finished
		self.quiz.update(finished: true)
	end


	private

		def grade
			if self.guess == self.word
				self.correct = true
			end
		end
end
