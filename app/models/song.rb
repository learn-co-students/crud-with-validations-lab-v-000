class Song < ActiveRecord::Base
  validates :title, presence: :true
  validates :title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: "Cannot be repeated by the same artist in the same year"
  }
  validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}, if: :released?
  validates :released, inclusion: { in: [true,false]}
  validates :artist_name, presence: :true
  validates :release_year, presence: true, if: :released?

  def relased?
    released
  end
  
end
