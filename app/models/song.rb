class Song < ActiveRecord::Base

  validates :title, :uniqueness => {:scope => [:artist_name, :release_year]}
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :release_year_must_be_present_when_released_is_true
  validates :release_year, numericality: { less_than_or_equal_to: (Date.today.year)}, if: :release_year_must_be_present_when_released_is_true

  def release_year_must_be_present_when_released_is_true
    self.released == true
  end


end
