class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: :artist_name}
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
  validate :release

  def release
    if self.released && release_year.present? && release_year > 2017
      errors.add(:release_year, "can't be in the future")
    elsif self.released && !release_year.present?
      errors.add(:release_year, "release year can't be empty")
    end
  end

  
end
