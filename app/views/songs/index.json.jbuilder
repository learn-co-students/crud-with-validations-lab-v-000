json.array!(@songs) do |song|
  json.extract! song, :id, :title, :released, :release_year, :artist_name
  json.url song_url(song, format: :json)
end
