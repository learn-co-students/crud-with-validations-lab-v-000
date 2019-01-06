class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released
  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: :released
  # validate :unique_by_artist_in_year?

  # def unique_by_artist_in_year?
  #   songs = Song.all
  #   songs.each do | song |
  #     if song.release_year == :release_year
  #       valid? = false
  #     end
  #   end
  # end


end