class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: [:artist_name, :release_year]}
    #found in apidock validates_uniqueness_of with scope

  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {less_than_or_equal_to: Date.current.year}

            # Rails Guide 5.3 Grouping Conditional validations
            # Rails Guide 2.8 Numericality
  end

  def released?
    released
  end


end
