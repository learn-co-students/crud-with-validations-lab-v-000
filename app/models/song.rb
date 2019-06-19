class Song < ApplicationRecord
  validates :title, presence: true,
  validates :released, presence: true, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released == true, numericality: { less_than_or_equal_to: Time.now.year}
  validates :artist_name, presence: true
  validate :title_repeated_in_same_year

  def title_repeated_in_same_year
    @songs = Song.all
    if @songs.any? do |song|
      song.artist_name == song_params[:artist_name] || song.release_year == song_params[:release_year] || song.title == song_params[:title]
      end
      errors.add(:title, "An artist cannot repeat a title in the same year")
    end
  end

end
