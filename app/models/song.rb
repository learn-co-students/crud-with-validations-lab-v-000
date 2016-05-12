class Song < ActiveRecord::Base
  validates :title, :artist_name, :genre, presence: true
  validates :title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: "This song has already been relesed this year."
  }

  validates :release_year, numericality: {less_than_or_equal_to: 2016}, if: :released
  validates :release_year, presence: true, if: :released

  # with_options if: :released? do |s|
  #   s.validates :release_year, presence: true
  #   s.validates :release_year, numericality: {
  #     less_than_or_equal_to: Date.today.year
  #   }
  # end

end


