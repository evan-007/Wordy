class List < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true, uniqueness: { scope: :user_id}
  has_many :wordlists
  has_many :words, through: :wordlists
  has_many :quiz_lists
  has_many :quizzes, through: :quiz_lists
end
