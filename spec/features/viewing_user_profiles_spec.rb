require 'spec_helper'

feature "Viewing user profiles" do
	scenario "can a profile after logging in" do
		user = create(:user)
		visit('/signin')
		fill_in 'Name', with: user.name
		fill_in 'Password', with: user.password
		click_button('Sign in')
		click_link('My profile')
		expect(page).to have_content(user.name)
	end

	scenario "cannot view a profile as an anonymous user"

end