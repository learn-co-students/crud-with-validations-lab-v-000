class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: "can't be repeated by the same artist in the same year"
  }
  validates :released, inclusion: { in: [true, false]}
  # validates :release_year, presence: true, if: :released_year_op
  validates :artist_name, presence: true

  #multiple validations use one condition(grouping condition validations)
  with_options if: :released do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end

  # def released_year_op
  #   if released == true
  #     true
  #   else
  #     false
  #   end
  # end
end
