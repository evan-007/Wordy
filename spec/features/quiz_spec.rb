require 'spec_helper'

feature "Quiz" do
	before do
			@user = create(:user)
			@category = create(:category)
			sign_in_as!(@user)
		end

	scenario "is created from categories" do
		visit user_quizzes_path(@user)
		click_link ('New Quiz')
		# select "Beginner", from: 'quiz[category_id]'
		find(:select, 'quiz[category_id]').first(:option, 'Beginner').select_option
		fill_in 'Name', with: 'Best quiz evah'
		click_button 'Create'
		expect(page).to have_content('Quiz created')
	end
end