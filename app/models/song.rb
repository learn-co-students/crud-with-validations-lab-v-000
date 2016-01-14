class Song < ActiveRecord::Base
  validates_presence_of :title, :artist_name
  # validates :released, inclusion: { in: [ "true", "false" ] }
  validates :release_year, presence: true, if: :released?
  validates :release_year, numericality: { less_than: Time.now.year }, :allow_nil => true
  validates :title,  uniqueness: { scope: :release_year, message: "Only once a year!"}

  def released?
    released == true
  end

end
