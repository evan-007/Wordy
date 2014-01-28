class AddFinishedToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :finished, :boolean, default: false
  end
end
