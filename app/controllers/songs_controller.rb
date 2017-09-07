class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    binding.pry
    @song.save

    redirect_to song_path(@song)
  end

    private

    def song_params
      params.require(:song).permit(:title, :release_year, :artist_name, :genre, :released)
    end
end
