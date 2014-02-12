require 'spec_helper'

feature 'Type 3 quiz' do
	before do
			@user = create(:user)
			@category = create(:category)
			sign_in_as!(@user)
		end
  
  scenario 'is set at Quiz#new' do
    visit new_quiz_path
    find(:select, 'quiz[list_id]').first(:option, 'Beginner').select_option
		fill_in 'quiz[name]', with: 'Best quiz evah'
    select('Unscramble', from: 'quiz[kind]')
		click_button 'Create'
		expect(page).to have_content('Quiz created')
    expect(Quiz.last.kind).to eq(3)
  end
  
  scenario 'shows scrambled sentences' do
    @list = create(:list)
    @userlist = create(:userlist, user: @user, list: @list)
		@word = create(:word)
    @word2 = create(:word, name: 'super')
		@wordlist = create(:wordlist, word: @word, list: @list)
    @wordlist2 = create(:wordlist, word: @word2, list: @list)
    @example = create(:example, word: @word)
    @example2 = create(:example, word: @word2, text: 'super stuff is great')
    visit new_quiz_path
    select(@list.name, from: 'quiz[list_id]')
		fill_in 'quiz[name]', with: 'Best quiz evah'
    select('Unscramble', from: 'quiz[kind]')
		click_button 'Create'
    visit quizzes_path
    click_link('Take quiz')
    expect(page).to have_content('Unscramble the sentence')
  end
end