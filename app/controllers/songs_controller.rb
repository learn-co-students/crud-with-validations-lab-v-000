class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update]
  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params(:title, :release_year, :released, :artist_name, :genre))

    if @song.save
      redirect_to show_song
    else
      render :new
    end
  end

  def edit
  end

  def update
    @song.update(song_params(:title, :release_year, :released, :artist_name, :genre))

    if @song.save
      redirect_to show_song
    else
      render :edit
    end
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_path
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params(*args)
    params.require(:song).permit(*args)
  end

  def show_song
    song_path(@song)
  end
end
