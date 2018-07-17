class Song < ActiveRecord::Base
  #validates that the specified attributes are not empty
  # validates :title, :artist_name, presence: { strict: true }
  # validates :title, :artist_name, presence: true
  validates :title, presence: true
  validates :artist_name, presence: true

  validates :title, uniqueness: {
    scope: [:artist_name, :release_year],
    message: "Cannot be repeated by the same artist in the same year"
  }

  # validates_inclusion_of :released, in:[true, false]
  validates :released, inclusion: { in: [true, false] } #validate the presence of a boolean field (where the real values are true and false)

  #Grouping Conditional validations
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.current.year
    }# validates that your attributes have only numeric values
  end
    # validates_presence_of :release_year
    # validates_numericality_of :release_year, less_than_or_equal_to: Date.current.year

  def released?
    released
  end

end
