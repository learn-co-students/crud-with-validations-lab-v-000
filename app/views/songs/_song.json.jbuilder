json.extract! song, :id, :title, :released, :release_year, :artist_name, :genre, :created_at, :updated_at
json.url song_url(song, format: :json)
