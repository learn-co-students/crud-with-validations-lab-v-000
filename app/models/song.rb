class Song < ActiveRecord::Base
  validates :title, presence: true
  #validates :title, uniqueness: {scope: [:release_year, :artist_name]}
  validates :title, uniqueness: {scope: :release_year}
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released?
  validates :released, inclusion: { in: [true, false] }
  validate :future_release_year?

  #invalid if artist has same song in same year

  def future_release_year?
    if release_year
      if release_year > 2018
        errors.add(:release_year, "must not be in the future")
      end
    end
  end

  def released?
    released
  end


end
