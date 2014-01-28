require 'spec_helper'

feature "Completing Quizzes" do
	before do
		@user = create(:user)
		@category = create(:category)
		@word_category = create(:word_category)
		sign_in_as!(@user)
		visit quizzes_path
		click_link ('New Quiz')
		find(:select, 'quiz[category_id]').first(:option, 'Beginner').select_option
		fill_in 'Name', with: 'Best quiz evah'
		click_button 'Create'
		expect(page).to have_content('Quiz created')
	end

	scenario "Submitting a quiz returns results" do
		visit quizzes_path
		click_link('Best quiz evah')
		expect(page).to have_content('somehtin')

	end

end