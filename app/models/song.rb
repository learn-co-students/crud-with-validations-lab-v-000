class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year }
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
  validates :release_year, presence: true, numericality: { less_than_or_equal_to: Time.now.year }, if: :released
  validates :genre, presence: true



  # validates :title, uniqueness: {
  #   scope: %i[release_year artist_name],
  #   message: 'cannot be repeated by the same artist in the same year'
  # }

  # with_options if: :released? do |song|
  #   song.validates :release_year, presence: true
  #   song.validates :release_year, numericality: {
  #     less_than_or_equal_to: Date.today.year
  #   }
  # end
  #
  # def released?
  #   released
  # end


  # validates :release_year, presence: true, if: :released?
  #   with_options if: :released? do|release|
  # release.validates :release_year, numericality: {less_than_or_equal_to: Time.current.year}
  # release.validates :release_year, presence: true
  # end
end
