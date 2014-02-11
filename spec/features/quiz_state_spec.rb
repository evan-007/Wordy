require 'spec_helper'

feature "Quiz states" do
  before(:each) do
    @user = create(:user)
    @quiz = create(:no_quiz_callback, user: @user)
    @question1 = create(:question, quiz: @quiz)
    @question2 = create(:question, quiz: @quiz)
    expect(@quiz.questions.count).to eq 2
  end
  
  scenario "initial state is ready" do
    expect(@quiz.state).to eq('ready')
  end
  
  scenario "state is :in_progress when a question is answered" do
    @question1.update(guess: 'eat')
    expect(@quiz.state).to eq('working')
  end

  scenario "state is :finished when all questions are answered" do
    @question1.update(guess: 'eat')
    @question2.update(guess: 'swim')
    expect(@quiz.state).to eq('finished')
  end
end