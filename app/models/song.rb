class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year }
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released?, numericality: {less_than_or_equal_to: Date.today.year}
  validates :artist_name, presence: true

  def released?
    self.released == true
  end

  #def date_checked
  #  if self.release_year != nil
  #    if self.release_year > Date.today.year
  #      false
  #    end
  #  end
  #end

end
