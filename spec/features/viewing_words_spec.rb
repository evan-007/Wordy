require 'spec_helper'

feature "Viewing word entries" do
	scenario "can view a list of all words" do
		visit '/dictionary'
		expect(page).to have_content("Here are the NGSL words")
	end

	scenario "can view an individual entry" do
		create(:word)
		visit '/dictionary'
		click_link "cats"
		expect(page).to have_content("IPA pronunciation:")
		expect(page).to have_content("Part of speech:")
		expect(page).to have_content("Definition:")
	end
end