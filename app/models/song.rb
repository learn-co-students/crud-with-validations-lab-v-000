class Song < ActiveRecord::Base
validates :title, presence: true, uniqueness: true
validates :released, inclusion: {in: [true,false]}
validates :artist_name, presence: true
validate :is_released?

  def is_released?
    if (self.released == true) && self.release_year == nil
       errors.add(:release_year, "Must Include Release Year")
    elsif self.release_year && self.release_year > Time.new.year
      errors.add(:release_year, "Release Year Cannot Be in the Future")
    end

  end



end
