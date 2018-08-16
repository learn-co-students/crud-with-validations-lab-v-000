# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Song.create([
  { title: "Song1", released: true, release_year: 2012, artist_name: "artist 1", genre: "genre1" },
  { title: "Song2", released: true, release_year: 2016, artist_name: "artist 2", genre: "genre2" }
])
