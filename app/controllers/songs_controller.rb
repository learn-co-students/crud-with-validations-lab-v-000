class SongsController < ApplicationController
  before_action :find_song, only: %i[show edit update destroy]
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def show; end

  def edit; end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def update
    if @song.update(song_params)
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_url
  end

  private

  def find_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song)
          .permit(:title, :artist_name, :release_year, :released, :genre)
  end
end
