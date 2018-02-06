class Song < ActiveRecord::Base
  validates :title, presence: true
  validates_uniqueness_of :title, scope: [:release_year, :artist_name]
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, :if => :released?
  validate :past_release_year
  validates :artist_name, presence: true

  def past_release_year
    if release_year.present? && release_year > Date.today.year
      errors[:release_year] << "Release year can't be in the future"
    end
  end
end
