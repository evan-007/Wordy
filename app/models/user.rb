class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	 # validates :name, presence: true, uniqueness: true
	has_many :lists, dependent: :destroy
	has_many :quizzes, dependent: :destroy
end
