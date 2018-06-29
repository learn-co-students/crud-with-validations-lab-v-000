class SongsController < ApplicationController
  before_action :current_song, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_param)
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
    if @song.update(song_param)
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

  def song_param
    params.require(:song).permit(:title, :release_year, :released, :genre, :artist_name)
  end

  def current_song
    @song = Song.find_by(id: params[:id])
  end
end
