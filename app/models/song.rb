class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :title, uniqueness: true, if: :release_year, uniqueness: true
  validates :artist_name, presence: true
  validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Time.now.year, if: :released }
  # validate :same_song_same_year#, on: :create
  #
  # def same_song_same_year
  #   @song = Song.all.last
  #   errors.add(:title, "two identically-named songs can't be created in one year") if Song.find_by(title: @song.title, release_year: @song.release_year)
  # end

  # it "is invalid if an artist tries to release the same song twice in a year" do
  #   Song.create!(valid_attributes)
  #   expect(Song.new(valid_attributes)).to be_invalid
  # end

end
