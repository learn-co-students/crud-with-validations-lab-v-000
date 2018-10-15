class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true
  validate :valid_released_year?

  def valid_released_year?
    if released && release_year.nil?
      errors.add(:release_year, "Needs Release Year")
    elsif release_year && release_year > Time.now.year
      errors.add(:release_year, "Release Year cannot be in the future.")
    end
  end

end
