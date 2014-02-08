class List < ActiveRecord::Base
  has_many :userlists
  has_many :users, through: :userlists
  validates :name, presence: true, uniqueness: { scope: :user_id}
  has_many :wordlists
  has_many :words, through: :wordlists

end
