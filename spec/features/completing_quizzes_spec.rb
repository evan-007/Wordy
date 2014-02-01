require 'spec_helper'

feature "Completing Quizzes" do
	before do
		@user = create(:user)
		@category = create(:category)
		@word = create(:word)
		@word_category = create(:word_category, word: @word, category: @category)
		@example = create(:example, word: @word)
		sign_in_as!(@user)
		visit quizzes_path
		click_link ('New Quiz')
		find(:select, 'quiz[category_id]').first(:option, 'Beginner').select_option
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
		expect(page).to have_content('Your answer')
	end

	scenario "Can review definitions before taking a quiz" do
		click_link('Review')
		expect(page).to have_content('so fluffy')
	end

	scenario "Can delete a quiz" do
		click_link "Best quiz evah"
		click_link "Delete"
		expect(page).to have_content("Quiz deleted!")
	end
end