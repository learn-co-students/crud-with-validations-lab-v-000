class Song < ActiveRecord::Base
  validates :title, presence: true
  validates_uniqueness_of :artist_name, scope: :release_year
  validates :release_year, presence: true, if: :released
  validate :released_year_not_future
  validates :genre, presence: true


def released_year_not_future
  if self.release_year.to_i >= Time.current.year
    errors.add(:release_year, "can't be in the future")
  end
end


end
