class Song < ActiveRecord::Base
  validates :title, presence: true
  validates_uniqueness_of :title, scope: [:artist_name, :release_year]
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, numericality: { less_than_or_equal_to: Time.now.year.to_i}, if: :released?

  def released?
    self.released
  end

end
