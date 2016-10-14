require 'rails_helper'

describe Artist, type: :model do
  it 'is not valid with a title of less than two characters' do
    artist = Artist.new(title: "Z")
    expect(artist).to have(1).error_on(:title)
    expect(artist).not_to be_valid
  end

  it "is not valid unless it has a unique name" do
    Artist.create(title: "John's Band")
    artist = Artist.new(title: "John's Band")
    expect(artist).to have(1).error_on(:title)
  end
end
