class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, numericality: {only_integer: true, less_than_or_equal_to: Date.current.year}, allow_nil: true
  validates :artist_name, presence: true
  validate :release_valid?

  def release_valid?
    if released == true && release_year == nil
      errors.add(:release_year, "Must not be blank")
    end
  end
end
