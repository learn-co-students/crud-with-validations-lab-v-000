class Song < ActiveRecord::Base
  validates :title, presence: true
  validates_presence_of :release_year, :if => :should_validate_release_year?
  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, :if => :should_validate_release_year?
  validates_uniqueness_of :release_year, scope: :artist_name

  def should_validate_release_year?
    released == true
  end

end
