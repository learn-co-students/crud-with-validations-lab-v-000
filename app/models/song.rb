class Song < ActiveRecord::Base

  validates :title, presence: true, uniqueness: {:scope => [:release_year, :artist_name]}
  validates :release_year, presence: true, if: :released?, numericality: {less_than_or_equal_to: Time.now.year}
  # validates :artist_name, presence: true 
  # validate :same_song

  # def song_is_same
  #   errors.add(:release_year, "Can't be made in same year")
  # end

end
