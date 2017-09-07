class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params(:title, :release_year, :artist_name, :genre, :released)) # create strong params
    # getting here in good shape
  end

  private

  def song_params(*args)
    params.require(:song).permit(*args)
  end
end
