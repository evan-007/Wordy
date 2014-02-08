require 'spec_helper'

feature "Adding words to lists" do
	scenario "signed in users can add words to their lists from word#show" do
		@word = create(:word)
		@user = create(:user)
		@list = create(:list)
		@userlist = create(:userlist, user: @user, list: @list)
		sign_in_as!(@user)
		visit dictionary_path
		click_link('cats')
		select("Best list ever", from: "list")
		click_on('Add')
		expect(page).to have_content('Added to your list')
	end

	scenario "can/can't add a word to the same list multiple times?"
	
end