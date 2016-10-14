require 'rails_helper'

describe Song, type: :model do
  it "is invalid if the rating is more than 5" do
    song = Song.new(rating: 10)
    expect(song).to have(1).error_on(:rating)
  end
end
