class SongsController < ApplicationController
  before_action :find_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params(:title, :release_year, :released, :genre, :artist_name))
    if @song.save
      redirect_to song_path(@song)
    else 
      render :'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @song.update(song_params(:title, :release_year, :released, :genre, :artist_name))
      redirect_to song_path(@song)
    else
      render :'edit'
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private

  def find_song
    @song = Song.find(params[:id])
  end

  def song_params(*args)
    params.require(:song).permit(*args)
  end

end
