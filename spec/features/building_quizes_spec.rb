require 'spec_helper'

feature "Building word quizzes" do
	before :each do
			user = create(:user)
			sign_in_as!(user)
			create(:list)
			create(:sys_list)
	end
	
	scenario "Users can build quizzes from profile pages" do
		visit '/'
		click_link "Quiz"
		click_link "New Quiz"
		select "Beginner", from: 'quiz[lists]'
		select "1", from: "Kind"
		fill_in "Name", with: "Easy quiz"
		click_button "Create"
		expect(page).to have_content ("Quiz created")
	end

	scenario "Users cannot build quizzes with invalid params" do
		visit '/'
		click_link "Quiz"
		click_link "New Quiz"
		click_button "Create"
		expect(page).to have_content ("Quiz was not created")
	end

	scenario "can view a quiz on user page"

	sceanrio "take a quiz"
end