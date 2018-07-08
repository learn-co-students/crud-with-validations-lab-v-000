class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {
      scope: [:release_year, :artist_name],
      message: "cannot be repeated by the same artist in the same year"
    }
    #Must not be blank
    #Cannot be repeated by the same artist in the same year

  validates :released, inclusion: { in: [true, false] }
    #Must be true or false

  validates :release_year, presence: true, if: :released?
  validates :release_year, numericality: { less_than: Date.today.year }, if: :released?
    #Optional if released is false
    #Must not be blank if released is true
    #Must be less than or equal to the current year

  validates :artist_name, presence: true
  #Must not be blank
  validates :genre, presence: true
  #Must not be blank

  def released?
    released
  end

end
