require 'spec_helper'

feature "Using the text tool" do
	scenario "returns a list of NGSL words" do
		visit word_tool_path
		fill_in 'text', with: 'here is some text alphabet'
		click_button "Submit"
		expect(page).to have_content("These words aren't on the NGSL:")
	end
end