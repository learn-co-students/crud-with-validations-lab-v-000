class Song< ActiveRecord::Base

  validates :title, presence: true
    validates :title, uniqueness: {scope: [:release_year, :artist_name], message: "cannot be repeated by the same artist in the same year"}
  validates :released, inclusion: { in: [true, false] }
  # validates :release_year, presence: true, numericality: {less_than_or_equal_to: Date.current.year} if :released
  validates :artist_name, presence: true

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {less_than_or_equal_to: Date.current.year}
  end


  def released?
    released
  end

end
