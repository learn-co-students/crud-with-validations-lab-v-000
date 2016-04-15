class Song < ActiveRecord::Base
  validates :artist_name, presence: true
  validates :title, presence: true #must not be blank
  validates :title, uniqueness: { scope: :release_year } #cannot be repeated by artist in same year
  validates :released, inclusion: { in: [true, false] } #must be boolean
  validates :release_year, presence: true, if: :released #must not be blank, if released true
  validate :release_not_future_year #must be less than or equal to current year

  def release_not_future_year
    #invalid, if released and release_year is greater than current year
    if release_year && release_year.to_i > Time.now.strftime("%Y").to_i
      errors.add(:release_year, "cannot be in the future")
    end
  end

end
