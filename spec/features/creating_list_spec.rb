require 'spec_helper'

feature "Creating lists" do
	scenario "can create a list with a valid name" do
		user = create(:user)
		sign_in_as!(user)
		click_link 'My profile'
		click_link 'New list'
		fill_in 'Name', with: 'My awesome list'
		click_button 'Create list'
		expect(page).to have_content('List created')
	end

	scenario "can view lists on user#show"

end