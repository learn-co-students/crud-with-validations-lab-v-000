class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :artist_name, presence: true
  validates :title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: "cannot be repeated by the same artist in the same year"
  }
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, presence: true, if: :released
  validate :release_year, :after_this_year?

  def after_this_year?
    if released && (release_year.to_s.to_i > Time.now.year)
      errors.add(:release_year, "invalid year")
    end
  end
end
