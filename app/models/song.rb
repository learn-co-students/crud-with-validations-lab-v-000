class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: [:artist_name, :release_year]}
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true
  validate :release_year_future


  private


  def release_year_future
    if release_year
      if released? && Time.new.year < release_year
        errors[:release_year] << "Release year must be equal to or earlier than current year if the song has already been released"
      end
    elsif released? && !release_year
      errors[:release_year] << "Please provide the release year if the song has been released."
    end
  end

end
