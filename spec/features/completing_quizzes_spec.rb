require 'spec_helper'

feature "Completing Quizzes" do
	before do
		@user = create(:user)
		@list = create(:list)
		@userlist = create(:userlist, user: @user, list: @list)
		@word = create(:word)
    @word2 = create(:word, name: 'super')
		@wordlist = create(:wordlist, word: @word, list: @list)
    @wordlist2 = create(:wordlist, word: @word2, list: @list)
		@example = create(:example, word: @word)
    @example2 = create(:example, word: @word2, text: 'super stuff is great')
		sign_in_as!(@user)
		visit quizzes_path
		click_link ('New Quiz')
		select @list.name, from: 'quiz[list_id]'
    select('Multiple choice', from: 'quiz[kind]')
		fill_in 'quiz[name]', with: 'Best quiz evah'
		click_button 'Create'
		visit quizzes_path
	end

	scenario "Can view list of questions" do
		click_link('Best quiz evah')
		expect(page).to have_content('cats')
	end

	scenario "Completing a quiz renders quizzes#results" do
		click_link "Take quiz"
		select @word.name, from: "question[guess]"
		click_button 'Next'
    click_button 'Next'
		expect(page).to have_content('Your answer')
	end

	scenario "Can review definitions before taking a quiz" do
		click_link('Best quiz evah')
		expect(page).to have_content('so fluffy')
	end

	scenario "Can delete a quiz" do
		click_link "Delete"
		expect(page).to_not have_content('Best quiz evah')
	end
  
  scenario "re-entering a quiz goes to first unanswered questions" do
		click_link "Take quiz"
		select @word.name, from: "question[guess]"
		click_button 'Next'
    visit quizzes_path
    click_link "Take quiz"
		expect(page).to have_content('2 of 2')
	end
end