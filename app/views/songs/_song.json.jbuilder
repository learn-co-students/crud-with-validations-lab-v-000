json.extract! song, :id, :title, :release_year, :integer, :artist_name, :genre, :created_at, :updated_at
json.url song_url(song, format: :json)
