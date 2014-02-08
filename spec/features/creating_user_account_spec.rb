require 'spec_helper'

feature "Creating a new account" do
	scenario "is valid with valid params" do
		visit(new_user_registration_path)
		fill_in 'Email', with: 'jjigae@naver.co.kr'
		fill_in 'Password', with: 'galbitang'
		fill_in 'Password confirmation', with: 'galbitang'
		click_button('Sign up')
		expect(page).to have_content('You have signed up successfully.')
	end
	scenario "is not valid without valid params" do
		visit(new_user_registration_path)
		click_button('Sign up')
		expect(page).to have_content('prohibited this user from being saved')
	end

	scenario "has default quiz lists" do
		@user = create(:user)
		expect(@user.lists.count).to eq 3
	end
end