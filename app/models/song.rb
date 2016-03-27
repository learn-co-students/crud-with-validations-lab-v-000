class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :title, uniqueness: {scope: :release_year}
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, presence: true, if: :released
  validate :release_year, :release_year_less_than_current_year?

  def release_year_less_than_current_year?
    if released && (release_year.to_s.to_i > Time.now.year)
      errors.add(:release_year, "cannot be in the future.")
    end
  end
end
