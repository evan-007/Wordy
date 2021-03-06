require 'spec_helper'

feature "Static pages" do

	scenario "show the homepage" do
		visit root_path
		expect(page).to have_content("Perfect Your English")
	end

	scenario "show the about page" do
		visit root_path
		click_link "About"
		expect(page).to have_content("About")
	end

	scenario "show the contact page" do
		visit contact_path
		expect(page).to have_content("Contact")
	end
end