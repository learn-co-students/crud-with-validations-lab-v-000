class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new(song_params)
  end

  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  private

  def song_params
    params.permit(:title, :artist_name, :genre, :released, :release_year)
  end
end
