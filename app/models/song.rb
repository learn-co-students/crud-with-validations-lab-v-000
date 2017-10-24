class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :title, uniqueness: {scope: :release_year}
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, presence: true, if: :released
  validate :release_year, :future_release_year?

  def future_release_year?
    if released && (release_year.to_s.to_i > Time.now.year)
      errors.add(:release_year, "no future release years.")
    end
  end
end
