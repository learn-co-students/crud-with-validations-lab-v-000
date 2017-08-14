require 'pry'
class Song < ActiveRecord::Base
  validates :artist_name, presence: true
  validates :released, inclusion: {in: [true,false]}
  validates :title, presence: true
  validate :valid_release_year
  validate :song_copy, on: :create

  def valid_release_year
    if released == true
      if release_year.present?
        unless release_year <= Time.new.year
          errors.add(:release_year, "release year can't be in the future")
        end
      else
         errors.add(:release_year, "release year must be present")
      end
    end
  end

  def song_copy
    if !Song.find_by(:title => title, :artist_name => artist_name, :release_year => release_year).nil?
      errors.add(:title, "this song has already been released by this artist")
    end
  end

end
