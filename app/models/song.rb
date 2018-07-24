class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: "cannot be repeated by the same artist in the same year"
  }
  validates :released, inclusion: { in: [ true, false ] }
  validates :artist_name, presence: true
#  validate :is_good_title?
#  validate :is_year_present?
#  validate :is_year_valid?
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end

  # Re[;aced with uniqueness constraint above
  # def is_good_title?
  #   if Song.where(:title => self.title, :release_year => self.release_year).count > 0
  #     errors.add(:title, "Title was already released in the same year")
  #   end
  # end

  # Replaced with "with_options" above
  # def is_year_present?
  #   if self.released
  #     if !self.release_year
  #       errors.add(:release_year, "Released Year Required")
  #     end
  #   end
  # end
  #
  # def is_year_valid?
  #   # note: 1800 arbitrary choice for minimum year.  Better check would probably be something later
  #   if self.release_year
  #       if self.release_year > Date.today.year || self.release_year < 1800
  #         errors.add(:release_year, "Invalid Year")
  #       end
  #   end
  # end

  def released? # for readability
    released
  end
end
