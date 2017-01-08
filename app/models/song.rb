class Song < ActiveRecord::Base

  validates :title, presence: true, uniqueness: { scope: [:release_year, :artist_name], :message => "Can only be used once per year, per artist." } # has to be a unique title per artist within the same year
  validates :released, inclusion: { in: [true, false]}
  with_options if: :released? do |song|
    song.validates :release_year, presence: true, numericality: { less_than_or_equal_to: Date.today.year }
  end
  validates :artist_name, presence: true


end
