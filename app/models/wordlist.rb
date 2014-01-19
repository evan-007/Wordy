class Wordlist < ActiveRecord::Base
	belongs_to :list
	belongs_to :word
	validates :word, presence: true
	validates :list, presence: true
end
