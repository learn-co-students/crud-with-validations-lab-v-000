
class Song < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :release_year,
                        if: Proc.new { |song| song.released } 
  validate :release_year_cannot_be_in_future, :cannot_release_twice_in_same_year

  private

  def release_year_cannot_be_in_future
    if release_year.present? && Time.now.year < release_year
      errors[:release_year] = "cannot be in the future"
    end
  end

  def cannot_release_twice_in_same_year
    if Song.find_by(self.attributes.except("id", "created_at", "updated_at"))
      errors[:release_year] = "cannot release the same song twice in the same year"
    end
  end
  
end
