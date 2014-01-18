require 'spec_helper'

describe List do
  it "is valid with a name" do
  	user = create(:user)
  	expect(user.lists.create(name: 'funny words')).to be_valid
  end

  it "is invalid without a name" do
  	user = create(:user)
  	expect(user.lists.create(name: nil)).to_not be_valid
  end

  it "does not allow duplicate names per user" do
  	user = create(:user)
  	list1 = user.lists.create(name: 'funny words')
  	expect(user.lists.build(name: 'funny words')).to have(1).errors_on(:name)
  end
  it "does allow two users to share a list name" do
  	user1 = create(:user)
  	user2 = create(:user, name: 'sarah', email: 'asdf@yui.com')
  	list1 = user1.lists.create(name: 'funny words')
  	expect(user2.lists.create(name: 'funny words')).to be_valid
  end
end
