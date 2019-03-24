class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :title, uniqueness: {scope: [:artist_name, :release_year]}

  validates :released, inclusion: { in: [true, false] }

  with_options if: :is_released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end
  # validates :release_year, numericality: true, {if: :is_released?, only_integer: true, less_than_or_equal_to: Time.now.year}

  validates :artist_name, presence: true

  def is_released?
    released
  end

end
