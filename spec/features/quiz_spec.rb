require 'spec_helper'

feature "Quiz" do
	before do
			@user = create(:user)
			@category = create(:category)
			@word_category = create(:word_category)
			sign_in_as!(@user)
		end
	scenario "categories are listed at user_quizzes_path" do
		visit user_quizzes_path(@user)
		expect(page).to have_content 'Beginner'
	end

	scenario "is created from categories" do
		visit user_quizzes_path(@user)
		click_link ('New Quiz')
		find(:select, 'quiz[category_id]').first(:option, 'Beginner').select_option
#		select 'Beginner', from: 'quiz[category_id]'
		fill_in 'Name', with: 'Best quiz evah'
		click_button 'Create'
		expect(page).to have_content('Quiz created')
	end
end