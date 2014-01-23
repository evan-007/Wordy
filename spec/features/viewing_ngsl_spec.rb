require 'spec_helper'

feature "Viewing NGSL lists" do
	before :each do
		user = create(:user)
		sign_in_as!(user)
		create(:list)
		create(:sys_list)
	end
	scenario "can view the lists on user profiles" do
		click_link 'My profile'
		click_link 'Beginner'
		expect(page).to have_content("Here is the beginner list:")
	end
end