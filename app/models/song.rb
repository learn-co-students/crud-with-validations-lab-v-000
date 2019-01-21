class Song < ActiveRecord::Base
  validates :title, presence: true
  #validates_uniqueness_of :title, scope: :release_year
  validates :title, uniqueness: {
    scope: %i[release_year artist_name],
    message: 'Only one title by the same artist per year'
  }
  validates :artist_name, presence: true
  #validates :release_year, presence: true, if: :released?
  #validate :less_than_or_equal_current_year?, if: :released?
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end

  # def less_than_or_equal_current_year?
  #   if (release_year == nil || release_year > Date.today.year)
  #     errors.add(:release_year, "must be less than or equal to the current year")
  #   end
  # end

  def released?
    released
  end
end
