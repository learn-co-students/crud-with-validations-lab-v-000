class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year }
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }

  with_options if: :is_released do |a|
    a.validates :release_year, presence: true
    a.validates :release_year, numericality: { less_than_or_equal_to: 2018 }
  end

  def is_released
    attributes["released"]
  end
end
