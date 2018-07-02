class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :valid_title
  validate :valid_year
  validates :artist_name, presence: true

  private

  def valid_title
    if Song.where(artist_name: artist_name, release_year: release_year, title: title).size > 0
      errors.add(:title, "cannot have the same name and artis released the same year")
    end
  end

  def valid_year
    if released == true
      if !release_year || release_year > Time.now.year
        errors.add(:release_year, "cannot be blank or greater than current year")
      end
    end
  end

end
