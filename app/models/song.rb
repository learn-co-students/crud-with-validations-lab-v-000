class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, presence: true
  validates :artist_name, presence: true

  with_options if: :released do |song|
    song.validates :release_year, presence: true,
                                  numericality: { less_than_or_equal_to: Time.now.year }
  end
end
