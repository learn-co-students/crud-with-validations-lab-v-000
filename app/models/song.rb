class Song < ActiveRecord::Base
  validates :title, presence: true 
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true
  validates :title, uniqueness: {scope: :release_year, message: "Only one per year"}
  validates :release_year, numericality: { less_than: Time.now.year }, :allow_nil => true
  validates :release_year, presence: true, if: :released?

  def released?
    released == true
  end

end


