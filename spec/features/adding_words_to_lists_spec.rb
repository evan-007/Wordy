require 'spec_helper'

feature "Adding words to lists" do
	scenario "signed in users can add words to their lists from word#show" do
		create(:word)
		user = create(:user)
		list = create(:list, user: user)
		sign_in_as!(user)
		visit('/')
		click_link('cats')
		select("Best list ever", from: "list")
		click_on('Add')
		expect(page).to have_content('Added to your list')
	end
end