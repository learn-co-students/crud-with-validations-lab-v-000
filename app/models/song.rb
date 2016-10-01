class Song < ActiveRecord::Base

  validates :title, :artist_name, :genre, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year,  numericality: { only_integer: true }, allow_nil: true
  validates :artist_name, uniqueness: { message: "#{Song.new.artist_name} Artist name has already been taken" }           

  validate :released_is_false?

  def released_is_false?
    if release_year == nil
      released == false
    end
  end
  # validates :released, length: {is: 10 }
end
