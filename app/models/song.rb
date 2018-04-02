class Song < ActiveRecord::Base
  t = Time.new

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :released, inclusion:{in: [true,false]}

  validates :release_year, presence: true, if: :released
  validates :release_year, length:{:maximum => t.year}
  validate :release_year_validate

  validates :artist_name, presence: true

  def release_year_validate
    t = Time.new
    if release_year == nil
      false
    elsif release_year > t.year
      errors.add(:release_year, "year is in the future")
    else
      true
    end
  end

end
