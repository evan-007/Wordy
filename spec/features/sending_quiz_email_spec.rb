require 'spec_helper'

feature "Sending email" do
	before do
		@user = create(:user)
		@list = create(:list)
		@word = create(:word)
		@wordlist = create(:wordlist, word: @word, list: @list)
		@example = create(:example, word: @word)
	end

	scenario "sends email after 5 quiz completions" do
		4.times do
			create(:quiz, user: @user, list: @list, finished: true)
		end
		@quiz = create(:quiz, user: @user, list: @list, finished: false)
		@quiz.update(finished: true)

		expect(open_last_email).to be_delivered_from "admin@somesite.com"
		expect(open_last_email).to be_delivered_to @user.email
	end

	scenario "sends email after 10 quiz completions" do
		9.times do
			create(:quiz, user: @user, list: @list, finished: true)
		end
		@quiz = create(:quiz, user: @user, list: @list, finished: false)
		@quiz.update(finished: true)

		expect(open_last_email).to be_delivered_from "admin@somesite.com"
		expect(open_last_email).to be_delivered_to @user.email
	end
end