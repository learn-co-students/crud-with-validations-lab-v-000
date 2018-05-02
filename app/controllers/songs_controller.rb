class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def new
    @song = Song.new
  end

  def edit
    song
  end

  def show
    song
  end

  def update
    if song.update(song_params)
      redirect_to song_path(song)
    else
      render :edit
    end
  end

  def destroy
    song.destroy
    redirect_to songs_path
  end

  private

  def song
    @song ||= Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :released, :artist_name, :genre, :release_year)
  end

end
