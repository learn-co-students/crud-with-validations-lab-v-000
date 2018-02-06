class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: [:released_year, :artist_name], message:"Artist cannot produce the same song in the same year."}
  validates :released, inclusion: { in: [true, false]}
  validates :released_year, length: {is: 4},  if: :is_released?, unless: :check_year
  validates :released_year, numericality: true, if: :is_released?, unless: :check_year

  def is_released?
    !!(self.released == true)
  end

  def check_year
    if self.released_year != nil
      if self.released_year > Date.today.year
        errors.add(:released_year, "Year cannot be in the future")
        false
      else
        true
      end
    end
  end
end
