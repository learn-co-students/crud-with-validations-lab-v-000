class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def show
    @song = song
  end

  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = song
  end

  def update
    @song = song
    if @song.update(song_params)
      redirect_to @song
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
    Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :release_year, :released, :genre, :artist_name)
  end 
end
