require 'spec_helper'

feature "Creating new lists" do
	before do
		@user = create(:user)
		sign_in_as!(@user)
	end

	scenario "valid words are added to a new list" do
		visit new_list_path
		fill_in 'list_name', with: "My words"
		fill_in 'words', with: "cat fish dog alphabet"
		click_button 'Submit'
		expect(page).to have_content('List created')
	end

	scenario "invalid words aren't added to a list" do
		visit new_list_path
		fill_in 'list_name', with: "Invalid stuff"
		fill_in 'words', with: "bunch 0f 1nv3lid stuff"
		click_button 'Submit'
		expect(page).to_not have_content('1nv3lid')
		expect(List.last.words).to_not eq('1nv3lid')
	end

	scenario "definitions are shown for new lists" do
		visit new_list_path
		fill_in 'list_name', with: "supa dupa"
		fill_in 'words', with: "monkey"
		click_button 'Submit'
		expect(page).to have_content('Any of various long-tailed')
	end
end