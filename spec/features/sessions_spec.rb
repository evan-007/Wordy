require 'spec_helper'

feature "Sessions" do

	scenario "can Sign in with valid params" do
		user = create(:user)
		visit '/'
		click_link "Sign in"
		fill_in "Name", with: user.name
		fill_in "Password", with: user.password
		click_button "Sign in"
		expect(page).to have_content "You're signed in"
	end

	scenario "cannot sign in with invalid params" do
		visit '/'
		click_link "Sign in"
		click_button "Sign in"
		expect(page). to have_content "Enter your name and password"
	end

	scenario "can logout" do
		user = create(:user, name: 'user', email: 'user@user.com')
		visit '/'
		click_link "Sign in"
		fill_in "Name", with: user.name
		fill_in "Password", with: user.password
		click_button "Sign in"
		click_link "Sign out"
		expect(page).to have_content "Signed out"
	end
end