class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }

  with_options if: :released do |rel|
    rel.validates :release_year, {
      presence: true,
      numericality: {
        only_integer: true,
        less_than_or_equal_to: Time.now.year
      },
      # this line replaces `validate artist_year_unique`
      uniqueness: {
        scope: :artist_name
      }
    }
  end

  # validate :artist_year_unique

  private

  # def artist_year_unique
  #   song = Song.find_by(title: self.title)
  #   if song && song.artist_name == self.artist_name && song.release_year == self.release_year
  #     self.errors.add(:unique, "must have unique artist name and year")
  #   end
  # end

end
