class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params(:title, :artist_name, :genre, :released, :release_year))
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
    @song = current_song
  end

  def edit
    @song = current_song
  end

  def update
    @song = current_song

    if @song.update(song_params(:title))
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song = current_song
    @song.delete
    redirect_to songs_path
  end

  #helpers

  def current_song
    Song.find(params[:id])
  end

  def song_params(*args)
    params.require(:song).permit(*args)
  end
end
