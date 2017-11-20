require 'date'

class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { :scope => [:release_year, :artist_name]}
  validates :released, inclusion: { in: [ true, false ] }
  validates :artist_name, presence: true
  validate :valid_release_year


  def valid_release_year
    current_year = Date.today.year
    if release_year != nil
      if release_year > current_year
        errors.add(:release_year, "Can't add a future release date")
      end
    else
      if released == true
        errors.add(:release_year, "Add a valid release date for a released song")
      end
    end
  end
end
