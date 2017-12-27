class Song < ActiveRecord::Base
  validates :title, presence: true #, uniqueness: true#{scope: release_year}
  #validates :released# , inclusion: { in: %w(true false)}
  #validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Time.now.year }
  validate :title_unique?, :release_year_needed?, :release_year_greater?

  # def released_tf?
  #   if self.released != true || self.released != false
  #     errors.add(:released, "Must be true or false.")
  #   end
  # end

  def title_unique?
    song = Song.find_by(title: self.title)
    if song && song.release_year == self.release_year
      errors.add(:title, "Artist cannot release same song in one year.")
    end
  end


  def release_year_needed?
    if self.released == true && (self.release_year == nil || self.release_year == "") #!release_year.valid?
      errors.add(:release_year, "Please add release year")
    end
  end

  def release_year_greater?
    if release_year && release_year > Time.now.year # && (!self.release_year == nil || !self.release_year == "") &&
      errors.add(:release_year, "Year must be less than or equal to the current year")
    end
  end

end
