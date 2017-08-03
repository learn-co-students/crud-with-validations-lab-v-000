songs = [
  {title: "King of the Closet",
  released: true,
  release_year: 2000,
  artist_name: "Blindside",
  genre: "metal"},
  {title: "Bat Country",
  released: true,
  release_year:2005,
  artist_name: "Avenged Sevenfold",
  genre: "metal"}
]
songs.each {|song| Song.create!(song)}
