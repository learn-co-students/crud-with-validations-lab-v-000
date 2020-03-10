require 'rails_helper'

RSpec.describe Song, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before do
    @song = Song.create(title: "My Song", released: true, release_year: 2010, artist_name: "Alicia Keys", genre: "R&B")
  end
end
