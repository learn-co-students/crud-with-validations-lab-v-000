class Song < ActiveRecord::Base
  validates :title, presence: true

  # :scope option within uniqueness that you can use to specify one or more attributes that are used to limit the uniqueness check
  validates :title, uniqueness: {scope: [:artist_name, :release_year], message: "Cannot be repeated by the same artist in the same year."}

  # validate the presence of a boolean field
  validates :released, inclusion: { in: [true, false] }


  # Grouping Conditional validations
  with_options if: :released do |song|
    song.validates :release_year, presence: true

    # numericality - This helper validates that your attributes have only numeric values.
    song.validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}
  end
end
