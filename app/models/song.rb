class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true
  validates :title, uniqueness: { scope: [:release_year, :artist_name],
    message: "Title must be original if released by the same artist in the same year." }
  validates :released, inclusion: { in: [true, false] }
  with_options if: :released? do |released|
    released.validates :release_year, presence: true
    released.validates :release_year, :numericality => { :less_than_or_equal_to => :current_year}
  end

  def released?
    released == true
  end

  def current_year
    Date.today.year
  end

  # def original_title?
  #   @song = Song.new
  #   if !@song.unique && @song.release_year && @song.artist
  #     errors.add(:title, "Title must be original if released by the same artist in the same year.")
  #   end
  # end
end
