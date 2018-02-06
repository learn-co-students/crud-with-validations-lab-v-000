class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.valid?
       @song.save

      redirect_to song_path(@song)
    else

      render :new
    end
  end

  def edit
  end

  def update
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

  def song_params(*args)
    params.require(:song).permit(:title,:genre,:artist_name, :released, :release_year)
  end

  def set_song
    @song = Song.find(params[:id])
  end
end
