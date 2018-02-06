require 'rails_helper'

RSpec.describe Song, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe Song do
    let(:attributes) do
      {
        title: "Buried In Detriot",
        artist_name: "Mike Posner",
        release_year: 2016,
        released: true,
        genre: "Pop"
      }
    end

    it "is a valid song" do
      expect(Song.new(attributes)).to be_valid
    end

    it "correctly has a title, artist, and release year" do
      expect(Song.new(attributes).title).to eq("Buried In Detriot")
      expect(Song.new(attributes).artist_name).to eq("Mike Posner")
      expect(Song.new(attributes).release_year).to eq(2016)
      expect(Song.new(attributes).released).to eq(true)
      expect(Song.new(attributes).genre).to eq("Pop")
    end
  end
end
