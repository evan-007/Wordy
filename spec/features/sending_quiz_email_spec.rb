require 'spec_helper'

feature "Sending email" do
	before do
		@user = create(:user)
		@category = create(:category)
		@word = create(:word)
		@word_category = create(:word_category, word: @word, category: @category)
		@example = create(:example, word: @word)
	end

	scenario "sends email after 5 quiz completions" do
		4.times do
			create(:quiz, user: @user, category: @category, finished: true)
		end
		@quiz = create(:quiz, user: @user, category: @category, finished: false)
		@quiz.update(finished: true)

		expect(open_last_email).to be_delivered_from "admin@somesite.com"
		expect(open_last_email).to be_delivered_to @user.email
	end

	scenario "sends email after 10 quiz completions" do
		9.times do
			create(:quiz, user: @user, category: @category, finished: true)
		end
		@quiz = create(:quiz, user: @user, category: @category, finished: false)
		@quiz.update(finished: true)

		expect(open_last_email).to be_delivered_from "admin@somesite.com"
		expect(open_last_email).to be_delivered_to @user.email
	end
end