songs = [
	 {
      title: "Talismanad",
      artist_name: "Airadfda",
      release_year: 2007,
      released: true,
      genre: "Post-Rockadsf"
    },
     {
      title: "Talismasdan",
      artist_name: "Airadf",
      release_year: 2005,
      released: true,
      genre: "Post-Roc3k"
    }
]

songs.each do |attr|
	Song.create!(attr)
end