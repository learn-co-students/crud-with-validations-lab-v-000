class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.find(params[:id])
    if @song.valid?
      @song = Song.create!(params.permit(:title, :artist_name, :release_year, :released, :genre))
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)
    if @song.valid?
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def delete
    @song = Song.find(params[:id]).destroy
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name, :released, :release_year, :genre)
  end
end
