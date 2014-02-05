require 'spec_helper'

feature "Uploading avatars" do
	scenario "during signup" do
		visit new_user_registration_path
		fill_in 'Email', with: 'email@yourface.com'
		fill_in 'Password', with: 'password'
		fill_in 'Password confirmation', with: 'password'
		attach_file 'Avatar', ("#{Rails.root}/spec/factories/heart_small.gif")
		click_button 'Sign up'
		expect(page).to have_content 'Welcome!'
		expect(User.last.avatar_file_name).to eq 'heart_small.gif'
	end

	scenario "on edit profile page" do
		@user = create(:user)
		sign_in_as!(@user)
		visit edit_user_registration_path(@user)
		fill_in 'Current password', with: @user.password
		attach_file 'user_avatar', ("#{Rails.root}/spec/factories/heart_small.gif")
		click_button 'Update'
		expect(page).to have_content 'updated your account'
		expect(User.last.avatar_file_name).to eq 'heart_small.gif'
	end
end