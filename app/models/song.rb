class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: [:release_year, :artist_name], message: "Can't repeat the same artist in the same year"}
  validates :artist_name, presence: true
  validates :released, inclusion: {in: [true,false]}
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}
  end

end

# can also use:
#   def repeated
#     if Song.find_by(title: title, artist_name: artist_name, release_year: release_year)
#       errors.add(:artist_name, "Cannot repeat a song title by the same artist within the same year.")
#     end
#   end
