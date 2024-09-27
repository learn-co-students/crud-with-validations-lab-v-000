class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year }
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released?
  validate :release_year_must_be_in_past

  def released?
    self.released == true
  end

  def release_year_must_be_in_past
    if self.release_year.present? && self.release_year > Date.today.year.to_i
      errors.add(:release_year, "release_year must be in the past")
    end
  end
end
