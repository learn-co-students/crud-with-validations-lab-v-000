json.extract! song, :id, :title, :artist_name, :genre, :released, :release_year, :created_at, :updated_at
json.url song_url(song, format: :json)
