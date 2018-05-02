class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: {in: [true, false]}
  with_options if: :released? do |released|
    released.validates :release_year, presence: true
    released.validates :release_year, numericality: {less_than_or_equal_to: Time.new.year}
  end
  validates :artist_name, presence: true
  validates :genre, presence: true
  validates :title, uniqueness: {scope: :release_year}
  #even better would be:
  #validates :title, uniqueness: {scope: [:release_year, :artist_name]}



  def released?
    self.released == true
  end
  # could've just done 'released' within the method

end
