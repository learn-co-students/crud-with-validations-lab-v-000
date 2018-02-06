class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true, if: :same_artist_same_year?
  validates :release_year, presence: true, numericality: { less_than_or_equal_to: Time.now.year }, if: "!!released"
  validates :artist_name, presence: true

  def same_artist_same_year?
    !Song.find_by(title: title, release_year: release_year).nil?
  end
end
