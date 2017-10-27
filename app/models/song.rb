class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { 
    scope: :release_year, 
    message: "already released this year" 
  }
  validates :released, exclusion: { in: [nil] }
  validates :artist_name, presence: true

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }
  end
end 
