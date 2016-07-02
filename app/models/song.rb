class Song < ActiveRecord::Base
  validates :title, presence: true
  validates_uniqueness_of :title, scope: :release_year

  validate :released_needs_year

  def released_needs_year
    if (released && (!release_year || release_year > Time.now.year)) || (!released && release_year)
      errors.add(:release_year, "need proper release year")
    end
  end

end
