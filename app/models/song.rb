class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :release_year, numericality: { less_than: Time.now.year }, :allow_nil => true
  validates :release_year, presence: true, if: :released?
  validates :artist_name, presence: true

  def released?
    released == true
  end

end