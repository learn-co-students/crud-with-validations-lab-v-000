class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, length: {is: 4},  if: :is_released?, unless: :check_year
  validates :release_year, numericality: true, if: :is_released?, unless: :check_year
  validates :title, uniqueness: {scope: [:release_year, :artist_name], message: "Artist cannot produce the same song in the same year."}

  def is_released?
    !!(self.released == true)
  end

  def check_year
    if self.release_year != nil
      if  self.release_year > Date.today.year
        errors.add(:release_year, "Year cannot be in the future")
        false
      else
        true
      end
    end
  end

end
