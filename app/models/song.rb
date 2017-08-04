class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, uniqueness: { scope: :release_year }
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, numericality: { only_integer: true, less_than_or_equal_to: Time.now.year }, if: :released?


private
  def released?
    self.released == true
  end

end
