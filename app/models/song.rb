class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true
  validates :title, uniqueness: { scope: :release_year && :artist_name}
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released
 
  validate :release_year_past_or_current
 
  def release_year_past_or_current
    if release_year.present? && release_year >= Time.now.year
      errors.add(:release_year, "can't be in the future")
    end
  end

  
end
