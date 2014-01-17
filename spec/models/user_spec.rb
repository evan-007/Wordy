require 'spec_helper'

describe User do
	it "is valid with a name, email, password and password_confirmation" do
		expect(build(:user)).to be_valid
	end

	it "is invalid without a name" do
		expect(build(:user, name: nil)).to have(1).errors_on(:name)
	end

	it "is invalid without an email" do
		expect(build(:user, email: nil)).to have(1).errors_on(:email)
	end

	it "is invalid without a password" do
		expect(build(:user, password: nil)).to have(1).errors_on(:password)
	end

	it "is invalid without a password_confirmation" do
		#get this for free from has_secure_password
	end

	it "is invalid if password and password_confirmation don't match" do
		expect(build(:user, password: 'haha', password_confirmation: 'lol')).to_not be_valid
	end

	it "is invalid without a unique email" do
		create(:user)
		expect(build(:user, email: 'dd@ducks.com')).to_not be_valid
	end

	it "is invalid without a unique name" do
		create(:user)
		expect(build(:user, name: 'duck')).to_not be_valid
	end

end
