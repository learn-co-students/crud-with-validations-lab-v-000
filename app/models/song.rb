class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :title, uniqueness: { scope: :release_year, message: "Only one song with a title per year."}
  validate :release_year_if_released


  def release_year_if_released
    if released && release_year.nil?
      errors.add(:release_year, 'Release year must be completed if released')
    elsif released && release_year > Time.now.year
      errors.add(:release_year, "Release can't be in the future")
    end
  end

end
