class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :released, inclusion: { in: [ true, false ] }
  validates :release_year, presence: true, numericality: { less_than_or_equal_to: Time.current.year}, if: :released
  validates :artist_name, presence: true
  validates :title, uniqueness: true, if: :same_year?

  def same_year?
    Song.all.any? {|song|song.release_year.to_s.include? release_year.to_s}
  end

end
