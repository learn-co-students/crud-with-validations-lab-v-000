require 'rails_helper'

RSpec.describe Song, type: :model do
  let(:valid_attributes) do
    {
      title: "Talisman",
      artist_name: "Air",
      released_year: 2007,
      released: true,
      genre: "Post-Rock"
    }
  end

  let(:missing_title) { valid_attributes.except(:title) }
  let(:missing_released_year) { valid_attributes.except(:released_year) }
  let(:unreleased) { missing_released_year.merge(released: false) }
  let(:future_released_year) { valid_attributes.merge(released_year: Date.today.year + 1) }

  it "is valid when expected" do
    expect(Song.new(valid_attributes)).to be_valid
  end

  it "is invalid without title" do
    expect(Song.new(missing_title)).to be_invalid
  end

  it "is invalid without release year when released is true" do
    expect(Song.new(missing_released_year)).to be_invalid
  end

  it "is valid without release year when released is false" do
    expect(Song.new(unreleased)).to be_valid
  end

  it "is invalid when the release year is in the future" do
    expect(Song.new(future_released_year)).to be_invalid
  end

  it "is invalid if an artist tries to release the same song twice in a year" do
    Song.create!(valid_attributes)
    expect(Song.new(valid_attributes)).to be_invalid
  end
end
