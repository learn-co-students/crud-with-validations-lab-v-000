class Song < ActiveRecord::Base
    validates :artist_name, presence: true

  validates :title, presence: true
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, uniqueness: true, presence: true, if: :released
  validates :release_year, numericality: { less_than: Time.now.year }, :allow_nil => true
end