class AddKindToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :kind, :integer
  end
end
