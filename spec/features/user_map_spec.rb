require 'spec_helper'

feature "Viewing a user map" do
	before do
		@user = create(:user, city: 'Seoul')
		sign_in_as!(@user)
	end
	scenario "Can see user locations when signed in" do
		visit user_map_path(@user)
		expect(page).to have_content("Wordy users around the world")
	end
end