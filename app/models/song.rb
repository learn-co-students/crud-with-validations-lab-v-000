class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: [ true, false ] }
  validates :artist_name, presence: true
  validate :exists_if_released_is_true, :less_than_current_year

  def exists_if_released_is_true
    if released && !release_year
      errors.add(:release_year, "needs to be populated")
    end
  end

  def less_than_current_year
    if release_year > Time.new.year
      errors.add(:release_year, "must be less than current year")
    end
  end

end
