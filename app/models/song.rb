class Song < ActiveRecord::Base
  validates :artist_name, presence: true
  validates :title, presence: true
  validates :released, inclusion: { in: [true, false] }
  validate :released_year_validation, :released_once

  def released_year_validation
    if released && !release_year.present?
      errors.add(:release_year, "- release year cannot be blank if song has been released.")
    elsif release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "- release year cannot be in the future.")
    end
  end

  def released_once
    dup = Song.find_by(title: title)
    if dup && release_year == dup.release_year && (dup.id != id || id == nil)
      errors.add(:title, "Title cannot be released more than once per year.")
    end
  end
end
