require 'Date'

class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: "song can only be released once a year"
  }
  validates :release_year, presence: true, if: :released
  validate :release_year_cannot_be_in_future

  def release_year_cannot_be_in_future
    if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "can't be in the future")
    end
  end

end
