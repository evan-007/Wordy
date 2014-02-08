class AddTasksCountToQuizzes < ActiveRecord::Migration
  def up
  	add_column :quizzes, :questions_count, :integer, default: 0

  	Quiz.reset_column_information 
  	Quiz.all.each do |q|
  		q.update_attribute :questions_count, q.questions.length
  	end
  end

  def down
  	remove column :quizzes, :questions_count
  end
end
