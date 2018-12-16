class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year }
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released?
      with_options if: :released? do|release|
    release.validates :release_year, numericality: {less_than_or_equal_to: Time.current.year}
    release.validates :release_year, presence: true
    end
    validates :genre, presence: true
end
