class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :released, presence: true
  validates :release_year, exclusion: { in: [false] }
end


#rspec ./spec/models/song_spec.rb --fail-fast
