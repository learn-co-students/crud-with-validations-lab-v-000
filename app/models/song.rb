class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year }
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true

  validates :release_year, presence: true, numericality: { less_than_or_equal_to: Time.now.year }, if: :released


  # validate released?
  #
  #   def released?
  #    if @song.released && @song.release_year = ""
  #      return
  #      errors.add(:released?, "Released year is missing")
  #
  #    elsif @song.release_year > Time.current.year
  #      return
  #      errors.add(:released?, "Release year is incorrect")
  #
  #    else
  #      true
  #    end
  #  end
end
