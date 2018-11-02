class Song < ActiveRecord::Base
  validates :title, presence: true
  validates_uniqueness_of :title, scope: [:artist_name, :release_year]
  validates :released, inclusion: { in: [true, false] }
  validate :testing_release_year
  validates :artist_name, presence: true

  private

  def released?
    if released
      true
    end
  end

  def testing_release_year
    if released? && release_year == nil
      errors.add(:release_year, "if released, released year cannot be blank")
    elsif released? && release_year > Date.today.year
      errors.add(:release_year, "can't be greater than current year")
    end
  end

end
