class SongsController < ApplicationController

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find_by_id(params[:id])
  end

  def edit
    @song = Song.find_by_id(params[:id])
  end

  def new
    @song = Song.new
  end

  def update
    @song = Song.find_by_id(params[:id])
    @song.update(song_params)
    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find_by_id(params[:id]).destroy
    redirect_to songs_url
  end

  private

    def song_params
      params.require(:song).permit(:title, :release_year, :artist_name, :genre, :released)
    end
end
