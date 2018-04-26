class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :release_year, absence: true, if: :not_released?
  validates :released, presence: true
  validate :release_year_check?

  #song is valid without release year when released is false


  #song is invalid without a release_year when released is true
  def release_year_check?
    if released == true #released is true
      if !release_year #there is no release year
        errors.add(:release_year, "must have a release year")
      end
    end
  end #end release_year_check?

  def not_released? #returns false if released is false and true if released is true
    released == false
  end

end
