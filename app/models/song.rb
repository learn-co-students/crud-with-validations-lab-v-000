class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true, :if => :not_same_year?
  validates :released, :inclusion => {:in => [true, false]}
  validates :release_year, numericality: {less_than_or_equal_to: Time.now.year }, :if => :released?
  validates :artist_name, presence: true
 end

  def not_same_year?
     if self.release_year != release_year
  end

  def released?
    self.released == true
  end
end
