require 'rails_helper'

RSpec.describe "songs/show", type: :view do
  before(:each) do
    @song = assign(:song, Song.create!(
      :title => "Title",
      :released => false,
      :artist_name => "Artist Name",
      :genre => "Genre"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Artist Name/)
    expect(rendered).to match(/Genre/)
  end
end
