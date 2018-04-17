class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: [:release_year, :artist_name]}
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released
  validates :artist_name, presence: true
  validate :future_release

  private

  def future_release
    if release_year.present? && release_year.to_i > Time.now.year
      errors.add(:released_year, "is in the future")
    end
  end
end
