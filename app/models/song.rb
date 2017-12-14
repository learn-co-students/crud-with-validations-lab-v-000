class Song < ActiveRecord::Base

  validates :title, length: {minimum:1}
  validates :title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: "Song with this artist and year already exists"
  }
  validates :released, inclusion: { in: [true, false] }
  with_options if: :released do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, :numericality => { :less_than_or_equal_to => 2017 }
  end
  validates :artist_name, length: {minimum:1}


end
