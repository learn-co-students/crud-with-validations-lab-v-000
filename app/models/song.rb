class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :title, uniqueness: { scope: [:release_year, :artist_name], message: "song cannot be released more than once within a year"}
  validates :released, inclusion: { in: [ true, false ] }
  validates_presence_of :release_year, if: :released?
  validates :release_year, numericality: { less_than_or_equal_to: Time.current.year }, if: :released?
  validates :artist_name, presence: true

end
