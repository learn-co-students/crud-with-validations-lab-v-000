class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, :uniqueness => { :scope => [:artist_name, :release_year]}
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released #returns true or false so shouldnt need to create method
  validate :max_year?
  validates :artist_name, presence: :true

  def max_year?
    if self.release_year
      if release_year <= Date.current.year
        return true
      else
        errors.add(:release_year, "no time traveling")
      end
    else
      false
    end
  end

end
