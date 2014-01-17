require 'spec_helper'

describe WordsController do
	describe "GET #index" do
		context "with params[:letter]" do
			it "populates an array of words starting with the letter"
			it "renders the :index view"
		end

		context "without params" do
			it "populates an array of all words" do
				cat = create(:word, name: 'cat')
				fish = create(:word, name: 'fish')
				get :index
				expect(assigns(:words)).to match_array([cat, fish])
			end
			it "renders the :index view" do
				get :index
				expect(response).to render_template :index
			end
			it "lists the words in alphabetical order"
		end
	end

	describe "GET #show" do 
		it "assigns the requested word to @word" do
			word = create(:word)
			get :show, name: word.name
			expect(assigns(:word)).to eq word
		end

		it "renders the :show template" do
			word = create(:word)
			get :show, id: word
			expect(response).to render_template :show
		end
	end

	describe "GET #edit" do
		it "assigns the requested word to @word" do
			word = create(:word)
			get :edit, id: word
			expect(assigns(:word)).to eq word
		end

		it "renders the :edit template" do
			word = create(:word)
			get :edit, id: word
			expect(response).to render_template :edit
		end
	end

	describe "PATCH #update" do
		context "with valid attributes" do
			it "locates the requested @word" do
				@word = create(:word)
				patch :update, id: @word, word: attributes_for(:word)
				expect(assigns(:word)).to eq(@word)
			end

			it "changes @word's attributes" do
				@word = create(:word)
				patch :update, id: @word, word: attributes_for(:word, name: 'monkey')
				@word.reload
				expect(@word.name).to eq('monkey')
			end

			it "redirects to the updated word" do
				@word = create(:word)
				patch :update, id: @word, word: attributes_for(:word, name: 'dog')
				expect(response).to redirect_to @word
			end
		end

		context "with invalid attributes" do
			it "does not update the word" do
				@word = create(:word, name: 'amazing')
				patch :update, id: @word, word: attributes_for(:word, name: nil)
				@word.reload
				expect(@word.name).to eq('amazing')
			end
			it "re-renders the #edit template" do
				@word = create(:word)
				patch :update, id: @word, word: attributes_for(:word, name: nil)
				expect(response).to render_template :edit
			end
		end
	end
end
