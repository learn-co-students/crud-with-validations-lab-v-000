class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true
  validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}, if: :released?
  validates :release_year, presence: true, if: :released?
  validates :title, uniqueness: {scope: [:artist_name, :release_year]}

  def released?
    released == true
  end

end
