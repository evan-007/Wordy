require 'spec_helper'

feature "Creating a new account" do
	scenario "is valid with valid params" do
		visit(new_user_path)
		fill_in 'Name', with: 'Kim'
		fill_in 'Email', with: 'jjigae@naver.co.kr'
		fill_in 'Password', with: 'galbitang'
		fill_in 'Password confirmation', with: 'galbitang'
		click_button('Register')
		expect(page).to have_content('Thanks for signing up!')
	end
	scenario "is not valid without valid params" do
		visit(new_user_path)
		click_button('Register')
		expect(page).to have_content('Please fill out the form')
	end
end