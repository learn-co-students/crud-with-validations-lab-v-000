class Song < ActiveRecord::Base
  validates :title, :genre, :artist_name, presence: true
  validates :title, uniqueness: {scope: [:release_year, :artist_name]}

  validates :released, inclusion: { in: [true, false] }

  validate :release_year_validation

  def release_year_validation
    if released == true && release_year == nil
      errors.add(:release_year, "can't be release without a released year given")
    elsif released == true && release_year > DateTime.now.year
      errors.add(:release_year, "can't be release with a future release year")
    end
  end


end
