class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def create
    @song = Song.new(songs_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def update
    @song = Song.find(params[:id])
    @song.update(songs_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def new
    @song = Song.new
  end

  def destroy
    @song = Song.find(params[:id]).destroy
    redirect_to songs_url
  end

  private

  def songs_params
     params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
end
