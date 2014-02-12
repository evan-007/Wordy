require 'spec_helper'

feature "Quiz" do
	before do
			@user = create(:user)
			@category = create(:category)
			sign_in_as!(@user)
		end

	scenario "is created from lists" do
		visit quizzes_path(@user)
		click_link ('New Quiz')
		find(:select, 'quiz[list_id]').first(:option, 'Beginner').select_option
		fill_in 'quiz[name]', with: 'Best quiz evah'
		click_button 'Create'
		expect(page).to have_content('Quiz created')
	end
end