require 'spec_helper'

feature "editing user lists" do
	before do
		@user = create(:user)
		sign_in_as!(@user)
	end

	scenario "users can edit lists" do
		visit lists_path
		first(:link, 'Edit').click
		fill_in 'Name', with: 'Bestuh Englishee wordsuh'
		click_button 'Submit'
		expect(page).to have_content('List updated')
	end
end