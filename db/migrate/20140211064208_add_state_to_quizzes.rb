class AddStateToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :state, :string
  end
end
