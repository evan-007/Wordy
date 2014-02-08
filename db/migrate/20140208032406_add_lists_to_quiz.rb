class AddListsToQuiz < ActiveRecord::Migration
  def change
    add_reference :quizzes, :list, index: true
  end
end
