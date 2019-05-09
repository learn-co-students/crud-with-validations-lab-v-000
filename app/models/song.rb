class Song < ApplicationRecord
  validates :title, :artist_name, presence: true
  validates :title, uniqueness: { scope: :release_year,
    message: "Songs cannot have the same name in a year" }

  validates :released, inclusion: { in: [true, false] }
  validates :released, exclusion: { in: [nil] }

  validates :release_year, presence: true

end
