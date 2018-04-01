class Song < ActiveRecord::Base
  validate :title_cannot_be_repeated_in_same_year
  validates :title, presence: true

  # validates :released, inclusion: { in: [true, false]} ASK: DO I NEED TO VALIDATE TRUE FALSE?
  validates :release_year, presence: true, if: :released
  validates :release_year, numericality: {less_than_or_equal_to: Time.current.year}, :allow_nil => true
  validates :artist_name, presence: true

  def title_cannot_be_repeated_in_same_year

    if Song.all.detect {|song| song.title == title && song.release_year == release_year}
      errors.add(:title, "cannot be repeated in the same year")
    end
  end
end
