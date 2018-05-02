class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: [:artist_name, :release_year] }
  # validate :unique_song?
  validates :released, inclusion: { in: [true, false]}
  # validate :release_info_valid?
  validates :release_year, numericality: { less_than_or_equal_to: 2018}
  validates :artist_name, presence: true

# custom validations to semantically represent the VALID CASE. for example if a
# song is valid if it is unique, then name song_unique? and describe valid
# example, (or invalid example with unless)

  # def unique_song?
  #   @repeat = Song.where(title: self.title)
  #     @repeat.none? do |song|
  #       song.release_year == self.release_year && song.artist_name == self.artist_name
  #     end
  # end

  # def release_info_valid?
  #   unless self.released == true && self.release_year == nil
  #   end
  # end


end
