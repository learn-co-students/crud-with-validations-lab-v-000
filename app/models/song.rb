class Song < ActiveRecord::Base
  validates :title, { presence: true, uniqueness: true }
  # validates :released, inclusion: { in: %w(true false) }
  validates :artist_name, presence: true
  validate :release_year?

  def release_year?
    return true unless released

    year = release_year.to_i
    if year.zero?
      errors.add(:release_year, 'must be number')
    elsif year > Date.today.year
      errors.add(:release_year, 'must be in the past')
    end
  end

end
