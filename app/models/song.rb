class Song < ActiveRecord::Base
  validates :title, presence: true # if :written_this_year?
  validates_uniqueness_of :title, scope: [:release_year, :artist_name]
  validates :released, inclusion: { in: [true, false] }
  # validates :release_year, presence: true if :released
  # validate :valid_year
  validates :artist_name, presence: true

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }
  end

  def released?
    released
  end

  # def written_this_year?
  #   @song = Song.find_by(title: self.title)
  #   if !@song.nil? && @song.artist_name == self.artist_name && @song.release_year == self.release_year
  #     false
  #   else
  #     true
  #   end
  # end
  #
  # def valid_year
  #   if !self.release_year.nil?
  #     self.release_year <= Time.now.year
  #   end
  # end

end
