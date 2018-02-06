class SongsController < ApplicationController
  before_action :find_song!, only: [:show, :edit, :update, :destroy]

  def index # GET
    @songs = Song.all
  end

  def new # GET
    @song = Song.new
  end

  def create # POST
    @song = Song.new(song_params)

    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def update # PATCH
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private

  def find_song!
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
end
