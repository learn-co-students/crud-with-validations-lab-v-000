class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: [true, false]}
  validates :release_year, presence: true, if: :released?
  validates :release_year, numericality: { less_than_or_equal_to: 2018}, if: :released?
  validates :artist_name, presence: true
  validate  :not_duplicate?

  def released?
    self.released == true
  end

  def not_duplicate?
    if self.released
      if Song.find_by(title: self.title, release_year: self.release_year)
        errors.add(:release_year, "cannot release same song twice in a year")
      end
    else
       true
     end
  end
end
