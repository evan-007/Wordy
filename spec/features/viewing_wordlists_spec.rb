require 'spec_helper'

feature "Viewing wordlists" do
	before do
		@user = create(:user)
		@list = create(:list, user: @user)
		@word = create(:word)
		@wordlist = create(:wordlist, list: @list, word: @word)
		sign_in_as!(@user)
	end

	scenario "can view a user's wordlists on Users#show" do
		click_link 'My profile'
		click_link @list.name
		expect(page).to have_content(@word.name)
	end
end
