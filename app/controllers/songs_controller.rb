class SongsController < ApplicationController

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
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @updated = Song.new(song_params)
    if @updated.valid?
      @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_path
  end

  private
    def song_params
      params.require(:song).permit(:title, :release_year, :released, :genre, :artist_name)
    end

end
