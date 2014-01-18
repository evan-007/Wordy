class Word < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	has_many :wordlists
	has_many :lists, through: :wordlists
end
