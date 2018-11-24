require 'rails_helper'

RSpec.describe Song, type: :model do
  it "is invalid with year great than current year" do
      song = Song.new(release_year: 5510)
      expect(song).to be_invalid
    end
end
