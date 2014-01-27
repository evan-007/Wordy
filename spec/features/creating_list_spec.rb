require 'spec_helper'

feature "Creating lists" do
	before :each do
		user = create(:user)
		list = create(:list, user: user)
		sign_in_as!(user)
		click_link 'My profile'
	end

	scenario "can create a list with a valid name" do
		click_link 'New list'
		fill_in 'Name', with: 'My awesome list'
		click_button 'Create list'
		expect(page).to have_content('List created')
	end

	scenario "can view lists on user#show" do
		expect(page).to have_content("Best list ever")
	end

	# scenario "can delete lists when signed in" do
	# 	click_link "Delete"
	# 	expect(page).to have_content('List deleted')
	# end
end