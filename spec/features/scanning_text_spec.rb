require 'spec_helper'

feature "Using the text tool" do
	scenario "returns a list of NGSL words" do
		visit 'text_tool_path'
		fill_in(:input), with: 'here is some text alphabet'
		click_button "submit"
		expect(page).to have_content("These words are not on the NGSL:")
	end
end