class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, numericality: true, if: :released?, unless: :check_year
  validates :artist_name, presence: true;

  def released?
    self.released
  end

  def check_year
    if self.release_year != nil
      if self.release_year > Time.now.year
        errors.add(:release_year, "The year cannot be in the future.")
        false
      else
        true
      end
    end
  end


end
