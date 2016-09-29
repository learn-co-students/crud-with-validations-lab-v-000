class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: [true, false]}
  validates :release_year, presence: true, if: :released?
  validate :not_in_the_future?
  validates :artist_name, presence: true
  validates :title, uniqueness: true

  def released?
    self.released == true
  end

  def not_in_the_future?
    if self.release_year.to_i >= Time.now.year
      errors.add(:release_year, "Date can't be in the future")
    end
  end

end
