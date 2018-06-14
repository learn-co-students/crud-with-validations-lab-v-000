Song.destroy_all

songs = [
  {title: "Talisman",artist_name: "Air",release_year: 2007,released: true, genre: "Post-Rock"},
  {title: "99 Problems",artist_name: "Jay-z", release_year: 2008, released: true, genre: "Hip-Hop"}
]

songs.each {|s| Song.create(s)}

p "Created #{Song.count} #{'Song'.pluralize(Song.count)}"