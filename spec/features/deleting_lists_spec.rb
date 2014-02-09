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
		@userlist = create(:userlist, user: @user, list: @list)
		@wordlist = create(:wordlist, word_id: @word.id, list_id: @list.id)
		3.times do 
			visit lists_path
			first(:link, 'Delete').click
		end
		visit lists_path
		click_link('Edit')
		# expect(page).to have_content('superman')
		# click_link('superman')
		click_link('Delete')
		expect(page).to have_content('Word Deleted!')
	end
end