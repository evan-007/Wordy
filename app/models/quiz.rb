class Quiz < ActiveRecord::Base
	belongs_to :user
	belongs_to :category #delete
	belongs_to :list
	validates :name, presence: true
	validates :kind, presence: true
	has_many :questions
  after_create :get_examples 
 #   if: Proc.new { |quiz| quiz.kind == 1 } #this works, but read about procs
#  after_create :kind_2,
#   if: Proc.new { |quiz| quiz.kind == 2 }
#  after_create :kind_3,
#    if: Proc.new { |quiz| quiz.kind == 3 }
  self.per_page = 10
	after_update :count, if: :state_changed?
	scope :finished, -> { where(state: 'finished') }
	after_update :state_check
  
  
	state_machine initial: :ready do
		event :starting do
			transition ready: :working
		end
		event :finishing do
			transition working: :finished
		end
	end
  
  def state_check
  		if self.questions.last.guess != nil
  			self.finishing
  		elsif self.questions.completed != nil
  			self.starting
  		end
 	end
  
	def get_questions
		@id = self.id
		self.category.words.each do |w|
			build_questions(w)
		end
	end

	def get_examples
		@id = self.id
    if self.kind == 1
		  self.list.words.each do |w|
			  answer_array = [w.name]
		  	self.list.words.where.not(name: w.name).sample(3).each do |word|
			  	answer_array << word.name
			  	end
		  	answer_array
        if w.examples.exists?
		  	  rand_example = w.examples.shuffle[0].text
		    	q = Question.create(word: w.name, quiz_id: @id, text: rand_example, answer: answer_array)
        else
          q = Question.create(word: w.name, quiz_id: @id, text: nil, answer: answer_array)
        end
	  	end
    elsif self.kind == 2
      self.list.words.each do |w|
			  answer_array = [w.name]
			  self.list.words.where.not(name: w.name).sample(3).each do |word|
          answer_array << word.name
				  end
			  answer_array
        q = Question.create(word: w.name, quiz_id: @id, text: w.definition, answer: answer_array)
      end
    elsif self.kind == 3
      self.list.words.each do |w|
			  answer_array = [w.name]
			  self.list.words.where.not(name: w.name).sample(3).each do |word|
          answer_array << word.name
				end
			  answer_array
        if w.examples.exists?
          rand_example = w.examples.shuffle[0].text.sub(/([^\s]+\s+[^\s]+[\s])/, '')
          example = rand_example
          q = Question.create(word: example, quiz_id: @id, text: example.split(' ').shuffle.join(' '), answer: answer_array)
        else
          q = Question.create(word: w.name, quiz_id: @id, text: nil, answer: answer_array)
        end
      end
    end
	end
  
  def kind_2
    @id = self.id
		self.list.words.each do |w|
			answer_array = [w.name]
			self.list.words.where.not(name: w.name).sample(3).each do |word|
        answer_array << word.name
				end
			answer_array
      q = Question.create(word: w.name, quiz_id: @id, text: w.definition, answer: answer_array)
    end
  end
  
  def kind_3
    @id = self.id
		self.list.words.each do |w|
			answer_array = [w.name]
			self.list.words.where.not(name: w.name).sample(3).each do |word|
        answer_array << word.name
				end
			answer_array
      rand_example = w.examples.shuffle[0].text.sub(/([^\s]+\s+[^\s]+[\s])/, '')
      example = rand_example
      q = Question.create(word: example, quiz_id: @id, text: example.split(' ').shuffle.join(' '), answer: answer_array)
    end
  end
  
  

    private
		def count
			if self.user.quizzes.finished.size % 5 == 0
				UserMailer.quiz_mail(self.user).deliver
			end
		end
end