class SongsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]

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
    if @song.save
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

    def destroy
      Song.find(params[:id]).destroy
      redirect_to songs_path
    end
  end

  private

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

  def set_post!
    @song = Song.find(params[:id])
  end
end
