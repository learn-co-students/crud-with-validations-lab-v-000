class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: [:artist_name, :release_year] }
  validates :genre, presence: true
  validate :valid_release_year?

  def valid_release_year?
    return true unless released

    if release_year.to_s.empty?
      errors.add(:release_year, 'must be number')
    elsif release_year > Date.today.year
      errors.add(:release_year, 'must be in the past')
    end
  end
end
