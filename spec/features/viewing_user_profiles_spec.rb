require 'spec_helper'

feature "Viewing user profiles" do
	scenario "can a profile after logging in" do
		@user = create(:user)
		visit('/signin')
		fill_in 'Email', with: @user.email
		fill_in 'Password', with: @user.password
		click_button('Sign in')
		visit user_path(@user)
		expect(page).to have_content('Edit Account')
	end

	scenario "cannot view a profile as an anonymous user"

end
