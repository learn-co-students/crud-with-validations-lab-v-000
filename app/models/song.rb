class Song < ActiveRecord::Base
  validates :title, format: {with: /[a-zA-Z]/}
  validates :title, presence: true
  validates :released, inclusion: { in: [ true, false ] }
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, inclusion: { in: 1900..Date.today.year }
  end

  validates :title, uniqueness: { scope: [:release_year, :artist_name]}

  validates :artist_name, format: {with: /[a-zA-Z]/}
  validates :genre, format: {with: /[a-zA-Z]/}

end
