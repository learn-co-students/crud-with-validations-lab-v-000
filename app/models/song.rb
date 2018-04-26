class Song < ActiveRecord::Base
  validates :title, presence: true
  #validates :title, uniqueness: {scope: [:release_year, :artist_name]}
  validates :title, uniqueness: {scope: :release_year}
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released?
  validates :released, inclusion: { in: [true, false] }
  validate :future_release_year?

=begin
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end
=end

  def future_release_year?
    if release_year
      if release_year > Date.today.year
        errors.add(:release_year, "must not be in the future")
      end
    end
  end

  def released?
    released
  end


end
