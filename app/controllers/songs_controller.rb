class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def show
    @song = Song.find_by(:id => params[:id])
  end

  def edit
    @song = Song.find_by(:id => params[:id])
  end

  def create
    @song = Song.new(song_params)

    if @song.valid?
      @song.save
      redirect_to @song
    else
      render :new
    end

  end

  def update
    @song = Song.find_by(params[:id])
    @song.update(song_params)

    if @song.valid?
      @song.save
      redirect_to @song
    else
      render :edit
    end

  end

  def destroy
    Song.find_by(params[:id]).destroy
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name,:genre)
  end
end
