class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    set_song
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    set_song
  end

  def update
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.permit(:title, :genre, :artist_name, :released, :release_year)
  end
end
