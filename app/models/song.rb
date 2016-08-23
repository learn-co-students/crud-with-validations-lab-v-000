class Song < ActiveRecord::Base
  validates :title, presence: true
  # validate :title, 
  validates :released, presence: true
  # validates :release_year, inclusion: { in: 1900..Date.today.year }, unless: :released?
  validates :artist_name, presence: true
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, inclusion: { in: 1900..Date.today.year }
  end

  def released?
    released == true
  end

  def duplicate_title
  end

end
