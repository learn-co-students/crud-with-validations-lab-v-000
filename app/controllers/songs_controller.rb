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

  def edit
    set_song
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def update
    set_song
    if @song.update(song_params)
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    set_song
    @song.destroy
    redirect_to songs_url
  end

  private

  def song_params
    params.require(:song).permit(
      :title, :release_year, :released, :genre, :artist_name
    )
  end

  def set_song
    @song = Song.find(params[:id])
  end
end
