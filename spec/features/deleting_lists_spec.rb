require 'spec_helper'

feature "Deleting lists" do
	before do
		@user = create(:user)
		sign_in_as!(@user)
	end

	scenario "users can delete lists" do
		visit lists_path
		first(:link, 'Delete').click
		expect(page).to have_content('List deleted!')
	end

	scenario "users can delete words from a list" do
		@word = create(:word)
		@list = create(:list, name: 'superman')
		@userlist = create(:userlist, user_id: @user.id, list_id: @list.id)
		@wordlist = create(:wordlist, word_id: @word.id, list_id: @list.id)
		3.times do 
			visit lists_path
			first(:link, 'Delete').click
		end
		visit lists_path
		click_link('Edit')
		click_link('Delete')
		expect(page).to have_content('Word deleted!')
	end
end