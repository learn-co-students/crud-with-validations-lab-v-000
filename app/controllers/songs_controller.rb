class SongsController < ApplicationController
  before_action :find_song, only: [:edit, :update, :show]

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

  def edit
  end

  def show
  end

  def update
    if @song.update(song_params(:title, :artist_name, :genre, :released, :release_year))
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    Song.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to songs_path
  end

private
  def song_params(*args)
    params.require(:song).permit(*args)
  end

  def find_song
    @song = Song.find(params[:id])
  end
end
