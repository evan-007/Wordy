require 'spec_helper'

feature 'Type 2 quiz' do
	before do
			@user = create(:user)
			@category = create(:category)
			sign_in_as!(@user)
		end
  
  scenario 'is set at Quiz#new' do
    visit new_quiz_path
    find(:select, 'quiz[list_id]').first(:option, 'Beginner').select_option
		fill_in 'quiz[name]', with: 'Best quiz evah'
    select('Matching', from: 'quiz[kind]')
		click_button 'Create'
		expect(page).to have_content('Quiz created')
    expect(Quiz.last.kind).to eq(2)
  end
  
  scenario 'shows definitions when a user takes it' do
    @list = create(:list)
    @userlist = create(:userlist, user: @user, list: @list)
		@word = create(:word)
    @word2 = create(:word, name: 'super')
		@wordlist = create(:wordlist, word: @word, list: @list)
    @wordlist2 = create(:wordlist, word: @word2, list: @list)
    visit new_quiz_path
    select(@list.name, from: 'quiz[list_id]')
    #find(:select, 'quiz[list_id]').first(:option, 'Beginner').select_option
		fill_in 'quiz[name]', with: 'Best quiz evah'
    select('Matching', from: 'quiz[kind]')
		click_button 'Create'
    visit quizzes_path
    click_link('Take quiz')
    expect(page).to have_content('Which word is it?')
  end
end