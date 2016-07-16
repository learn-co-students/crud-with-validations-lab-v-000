class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year, message: "should happen once per year"}
  validates :released, inclusion: { in: [true, false]  }
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :song_released?
  validate :released_year, unless: Proc.new { |r| r.released == false}

  def song_released?
    !!released
  end

  def released_year
    if release_year.nil?
      errors.add(:release_year, "can't be nil when released equal true")
    elsif release_year > Date.today.year
      errors.add(:release_year, "can't be greater than current year")
    end
  end
end
