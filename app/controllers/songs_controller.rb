class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def show
    @song = Song.find_by(id: params[:id])
  end

  def edit
    @song = Song.find_by(id: params[:id])
    if @song.update(song_params(:title, :release_year, :artist_name, :genre))
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def create
    @song = Song.new(song_params(:title, :release_year, :artist_name, :genre))
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def song_params(*args)
    params.require(:song).permit(*args)
  end
end
