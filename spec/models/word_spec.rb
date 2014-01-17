require 'spec_helper'

describe Word do
  it "is valid with a name, definition, pos and ipa" do
  	expect(Word.create(name: 'cat', definition: 'cute little animal', pos: 'noun', ipa: '/c/ /ae/ /t/')).to be_valid
  end

  it "is invalid without a name" do
  	expect(Word.create(name: nil)).to_not be_valid
  end

  it "is invalid with a duplicate name" do
  	Word.create(name: 'cat')
  	expect(Word.create(name: 'cat')).to have(1).errors_on(:name)
  end
end
