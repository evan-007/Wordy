class AddCorrectToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :correct, :boolean
  end
end
