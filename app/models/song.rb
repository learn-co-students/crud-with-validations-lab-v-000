class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: [true, false] }
  validate :release_year_presence
  validates :artist_name, presence: true

  def release_year_presence
    if self.released
      unless self.release_year
        errors.add(:release_year, "Released Song must have a released year.")
      else
        now = Time.new
        if now.year < self.release_year
          errors.add(:release_year, "Release year is in the future.")
        end
      end
    end
  end
end
