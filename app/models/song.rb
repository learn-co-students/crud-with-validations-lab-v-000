require 'date'

class Song < ActiveRecord::Base
  validates :title, presence: true,
                    uniqueness: {scope: [:release_year, :artist_name], message: "This song already came out in this year."}
  validates :released, inclusion: {within: [true,false]}
  validates :artist_name, presence: true
  validate :needs_release_year?
  validate :song_cant_be_released_in_the_future

  def needs_release_year?
    if released
      errors.add(:release_year, "Must enter a release year.") if release_year.blank?
    end
  end

  def song_cant_be_released_in_the_future
    if !!release_year
      errors.add(:release_year, "Song cannot be released in the future") if release_year > Date.today.year
    end
  end

end
