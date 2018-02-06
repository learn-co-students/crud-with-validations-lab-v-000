class SongsController < ApplicationController

  def new
    @song = Song.new
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
   @song = Song.find(params[:id])
  end

  def create
    @song = Song.create(song_params)
    if @song.valid?
      redirect_to song_path(@song)
    else
     render :new
    end
  end

  def update
    @song = Song.find(params[:id])
    valid = @song.update(song_params)
    if valid
      redirect_to song_path(@song)
    else
      render :edit
    end
  end
  def index
    @songs = Song.all
  end
  def destroy
  Song.find(params[:id]).destroy
  end

  private

  def song_params
    params.permit(:title, :released, :release_year, :artist_name, :genre)
  end
end
