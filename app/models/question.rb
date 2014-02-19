class Question < ActiveRecord::Base
	belongs_to :quiz, counter_cache: true
	serialize :answer, Array
	before_update :grade
	acts_as_list scope: :quiz
	scope :correct, -> { where(correct: true) }
	scope :incorrect, -> { where(correct: false) }
	scope :completed, -> { where.not(guess: nil) }
	scope :incomplete, -> { where(guess: nil) }
	after_update :call_state_check

	def finished
		self.quiz.update(finished: true)
	end

	def call_state_check
		self.quiz.state_check
	end
  
  




	private

		def grade
			if self.guess == self.word
				self.correct = true
			end
		end
end
