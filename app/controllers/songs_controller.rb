class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
  end

  def show
    @song = Song.find(params[:id])
  end

  def delete
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name, :released, :release_year, :genre)
  end


end
