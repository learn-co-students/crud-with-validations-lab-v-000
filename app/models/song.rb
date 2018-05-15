class Song < ActiveRecord::Base
  validates :title, presence: true
  validates_uniqueness_of :title, scope: :release_year
  validates :released, exclusion: { in: %w(true false),
  message: "%{value} is not a boolean" }
  validates :artist_name, presence: true
  validate :released?

  def released?
    if released == true && (!release_year.present? || release_year > Date.today.year)
      errors.add(:release_year, "Do you own a time machine? I want a ride!")
    end
  end
end
