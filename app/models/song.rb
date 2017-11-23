class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: [:artist_name, :release_year],
  message: "cannot be repeated by the same artist in the same year"}

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end
  # include ActiveModel::Validations
  # validates_with MyValidator, if: :release_year, presence: true

  def released?
  released
      # errors[:release_year] << "Release Year can't be blank."
    # end
  end
end
#
# def validate(record)
#   if Song.all.any? do |song|
#     song.artist_name == record.artist_name && song.release_year == record.release_year && song.title == record.title
#     errors[:base] << "This artist already has a song with this title released in this same year."
#     end
#   end
# end
