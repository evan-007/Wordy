class Wordlist < ActiveRecord::Base
	belongs_to :list
	belongs_to :word
end
