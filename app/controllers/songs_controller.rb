class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
  end

  def show
  end

  def edit
    set_song
  end

  def delete
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
end
