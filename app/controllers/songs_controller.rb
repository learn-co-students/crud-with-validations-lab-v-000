class SongsController < ApplicationController
  before_action :set_song, only: [:show, :update, :edit, :destroy]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to song_url(@song)
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @song.update(song_params)
      redirect_to song_url(@song)
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_url
  end

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
end
