class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :release_year, presence: true
  validates :released, presence: true
  validate :release_year_check?

  #song is valid without a release_year when release is false
  def release_year_check?
    if released == true
      if !release_year #if there is no release year
        errors.add(:release_year, "must have a release year")
      end
    end
  end #end release_year_check?

end
