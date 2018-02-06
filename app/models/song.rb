class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: [true, false]
  validates :release_year, presence: true, uniqueness: true, numericality: { only_integer: true, less_than_or_equal_to: Time.new.year }, if: :released?
  validates :artist_name, presence: true

end
