class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true
  validates :title, uniqueness: { scope: [:release_year, :artist_name] }
  validates :released, inclusion: { in: [true, false]}
  validates :release_year, presence: true, if: :released?
  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: :released?

  # Optional if released is false
  # Must not be blank if released is true
  # Must be less than or equal to the current year

  #  with_options if: :released? do |song|
  #   song.validates :release_year, presence: true
  #   song.validates :release_year, numericality: {
  #     less_than_or_equal_to: Date.today.year
  #   }
  # end

  def released?
    released
  end

end
