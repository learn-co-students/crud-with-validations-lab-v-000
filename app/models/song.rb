class Song < ActiveRecord::Base
  validates :title, presence: true
  validates_uniqueness_of :title, scope: [:release_year, :artist_name]
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, presence: true, if: :released
  validate :valid_year

  def valid_year
    if release_year != nil
      if Time.new.year <= release_year
        errors.add(:release_year, "can't be in the future")
      end
    end
  end
end
