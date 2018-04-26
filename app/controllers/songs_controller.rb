class SongsController < ApplicationController

  def index
    @songs = Song.all
    render :index
  end

  def new
    @song = Song.new
  end

  def show
    @song = Song.find(params[:id])
  end

  def create
    @song = Song.create(song_params)
    redirect_to song_path(@song)
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
  end

  def delete
  end

  private

  def song_params
    params.permit(:song, :title, :released, :release_year, :artist_name, :genre)
  end


end
