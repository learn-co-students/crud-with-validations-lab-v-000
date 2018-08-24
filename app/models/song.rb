class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year}
  validates :released, inclusion: { in: [true, false]}
  validates :release_year,
            numericality: {only_integer: true, less_than_or_equal_to: Time.now.year},
            if: :released
  validates :artist_name, presence: true
  # validates :genre
end
